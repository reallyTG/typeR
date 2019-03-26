library(fredr)


### Name: fredr_category_related_tags
### Title: Get the related FRED tags within a category
### Aliases: fredr_category_related_tags

### ** Examples

## No test: 
# First, get the tags for the "Production & Business Activity" category
fredr_category_tags(1L)
# Then, get the tags related to "business" and "monthly" for the
# "Production & Business Activity" category
fredr_category_related_tags(category_id = 1L, tag_names = "business;monthly")
## End(No test)



