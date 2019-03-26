library(internetarchive)


### Name: ia_metadata
### Title: Access the item metadata from an Internet Archive item
### Aliases: ia_metadata

### ** Examples

ats_query <- c("publisher" = "american tract society")
ids       <- ia_search(ats_query, num_results = 3)
items     <- ia_get_items(ids)
metadata  <- ia_metadata(items)
metadata



