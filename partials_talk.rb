# PARTIALS!!!!!!!!!!!!

# Named with a leading underscore (ex. _form.html.erb)
# Like subroutines, help you "de-clutter" your views

# FORMS:

# app/views/posts/_form.html.erb

<%= form_for @post do |f| %>
  <%= f.label :title  %>
  <%= f.text_field :title %>
  <br>
  <%= f.label :body %>
  <%= f.text_area :body %>
  <br>
  <%= f.submit %>
<% end %>

# app/views/posts/new.html.erb

<h1>Create a new post!</h1>

<%= render 'form' %>

<%= link_to 'Back', posts_path %>

# app/views/posts/edit.html.erb

<h1>Edit your post</h1>

<%= render 'form' %>

<%= link_to 'Back', posts_path %>

# NESTING:

# What if I have comments that belong to post?
# app/views/comments/_form.html.erb

<%= form_for [@post, @comment] do |f| %>
  <%= f.label :body  %>
  <%= f.text_area :body %>
  <br>
  <%= f.submit  %>
<% end %>

# I might have a separate page for accessing the form

<h1>Edit your comment</h1>

<%= render 'form' %>

<%= link_to 'Back', post_path(@comment.post_id) %>

# But what if I want the form to be accessible with the post?
# app/views/posts/show.html.erb


<h2><%= @post.title %></h2>
<p><%= @post.body %></p>
<%= render '/comments/form' %>

# You might want to consider using AJAX
# But the point is, accessing nested forms is POSSIBLE! (Woo!)

-----------------------------------------------
# LOCAL VARIABLES:

# What else can I do with partials?
# Use a local variable within the form declaration:

<%= form_for post do |f| %>

# Then specify variables when I render:

<h1>New post</h1>
<%= render partial: "form", locals: {post: @post} %>

<h1>Edit post</h1>
<%= render partial: "form", locals: {post: @post} %>

# Or, let's say you have a partial
# _customer.html.erb
# It contains a local variable "customer"
# You could do this:

<%= render partial: "customer", locals: {customer: @customer} %>

# OR you could just write this:

<%= render @customer %>

-----------------------------------------------------
# COLLECTIONS:

# Let's consider another partial:

# app/views/posts/_post.html.erb

<p>Post Name: <%= post.name %></p>

# I have a local variable "post" that displays the post name

# app/views/posts/index.html.erb
# In my posts index, I can render a collection
# To view all posts

<h1>Posts</h1>
<%= render partial: "post", collection: @posts %>

# OR, more concisely:

<h1>Posts</h1>
<%= render @posts %>

# HETEROGENEOUS COLLECTIONS:

# app/views/contacts/index.html.erb

<h1>Contacts</h1>
<%= render [customer1, employee1, customer2, employee2] %>

# Rails will magically know where to find and
# Apply these partials!

# app/views/customers/_customer.html.erb

<p>Customer: <%= customer.name %></p>

# app/views/employees/_employee.html.erb

<p>Employee: <%= employee.name %></p>

------------------------------------------------
# OTHER COOL THINGS:

# You can create partials for layouts:

<%= render partial: "link_area", layout: "graybar" %>