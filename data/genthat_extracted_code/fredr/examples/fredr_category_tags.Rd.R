library(fredr)


### Name: fredr_category_tags
### Title: Get the FRED tags for a category
### Aliases: fredr_category_tags

### ** Examples

## No test: 
# Tags assigned to series in the "Production & Business Activity" category
fredr_category_tags(category = 1L)
# Select the "nation" and "monthly" tags in the "Production & Business Activity" category
fredr_category_tags(category = 3L, tag_names = "nation;monthly", order_by = "popularity")
## End(No test)



