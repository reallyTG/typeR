library(discgolf)


### Name: users
### Title: Work with users
### Aliases: users user users_list user_create user_activate user_delete
###   user_update_email user_update_username

### ** Examples

## Not run: 
##D # list a user
##D user('sckott')
##D user('cboettig')
##D 
##D # list users
##D users_list('staff')
##D users_list('new')
##D 
##D # create a user
##D (x <- user_create("jane doe", "janie@doe.com", "jane_doe",
##D   "fTh6bmoPaaWrlI5fLDM6wy"))
##D 
##D # activate a user
##D user_activate(x$user_id)
##D 
##D # upate email address
##D user_update_email(username = 'jane_doe', email = 'jane2@doe.com')
##D 
##D # upate user name
##D user_update_username('jane_doe', 'jane_doe5')
##D 
##D # delete a user
##D user_delete(x$user_id)
## End(Not run)



