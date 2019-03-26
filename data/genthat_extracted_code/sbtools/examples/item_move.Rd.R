library(sbtools)


### Name: item_move
### Title: Move item from one folder to another
### Aliases: item_move

### ** Examples

## Not run: 
##D # create 1st folder
##D (fold1 <- folder_create(user_id(), "bear123"))
##D (res <- item_create(fold1, "item-to-move"))
##D 
##D # create 2nd folder
##D (fold2 <- folder_create(user_id(), "bear456"))
##D 
##D # move item in 1st folder to 2nd folder
##D (res2 <- item_move(res, fold2))
##D 
##D # test identical
##D identical(res2$parentId, fold2$id)
## End(Not run)



