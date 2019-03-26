library(aws.iam)


### Name: create_group
### Title: Manage IAM User Groups
### Aliases: create_group update_group delete_group get_group_users
###   list_groups add_user remove_user

### ** Examples

## Not run: 
##D  list_groups()
##D 
##D # create group
##D (g <- create_group("example"))
##D # rename
##D update_group(g, "example2")
##D list_groups()
##D 
##D # create example user
##D u <- create_user("example-user")
##D # add user to group
##D add_user(u, "example2")
##D 
##D get_group_users("example2")
##D 
##D # cleanup
##D remove_user(u, "example2")
##D delete_user(u)
##D delete_group("example2")
## End(Not run)



