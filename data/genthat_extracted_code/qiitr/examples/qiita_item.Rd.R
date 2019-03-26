library(qiitr)


### Name: qiita_item
### Title: Qiita Item (Article) API
### Aliases: qiita_delete_item qiita_get_items qiita_get_stocks
###   qiita_is_stocked_item qiita_item qiita_post_item qiita_stock_item
###   qiita_unstock_item qiita_update_item

### ** Examples

## Not run: 
##D # get items by item ID
##D qiita_get_items(item_id = "7a78d897810446dd6a3b")
##D 
##D # get items by tag ID
##D qiita_get_items(tag_id = c("dplyr", "tidyr"), per_pages = 10L, page_limit = 1L)
##D 
##D # get items by user ID
##D qiita_get_items(user_id = "yutannihilation")
##D 
##D # Post an item. Note that the post is private by default.
##D # You should manually check if the post is valid before make it public.
##D item <- qiita_post_item(title = "test", body = "This is an example.")
##D 
##D # update the post
##D qiita_update_item(item$id, title = "test", body = "**This is a strong example!**")
##D 
##D # delete the post
##D qiita_delete_item(item$id)
## End(Not run)




