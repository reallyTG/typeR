library(fredr)


### Name: fredr_category_series
### Title: Get the series in a category
### Aliases: fredr_category_series

### ** Examples

## No test: 
# Top 10 most popular series belonging to the "Employment Cost Index" category
fredr_category_series(category_id = 1L, limit = 10L, order_by = "popularity")
# Series in the "Employment Cost Index" category, ordered by descending observation frequency
fredr_category_series(category_id = 4L, order_by = "frequency", sort_order = "desc")
## End(No test)



