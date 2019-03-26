library(discgolf)


### Name: groups
### Title: Work with groups
### Aliases: groups group_members group_create group_delete

### ** Examples

## Not run: 
##D # all groups
##D groups()
##D 
##D # specific group by name
##D group_members("admins")
##D group_members("moderators")
##D group_members("trust_level_3")
##D 
##D # create a group
##D (res <- group_create("group_testing2"))
##D 
##D # delete a group
##D group_delete(res$basic_group$id)
## End(Not run)



