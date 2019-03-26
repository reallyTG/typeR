library(internetarchive)


### Name: ia_item_id
### Title: Access the item IDs from an Internet Archive items
### Aliases: ia_item_id

### ** Examples

ats_query <- c("publisher" = "american tract society")
ids       <- ia_search(ats_query, num_results = 3)
items     <- ia_get_items(ids)
ia_item_id(items)



