library(fredr)


### Name: fredr_series_search_text
### Title: Search for a FRED series.
### Aliases: fredr_series_search_text fredr_series_search_id

### ** Examples

## No test: 
# search for series with text matching "oil" and return the top 10 most popular
# series
fredr_series_search_text(
  search_text = "oil",
  order_by = "popularity",
  limit = 10
)
# search for series with text matching "oil" with the tag "usa" and return the
# top 10 search results
fredr_series_search_text(
  search_text = "oil",
  order_by = "search_rank",
  limit = 10,
  tag_names = "usa"
)
# search for series with text matching "unemployment" and return only series
# with monthly frequency
fredr_series_search_text(
  search_text = "unemployment",
  filter_variable = "frequency",
  filter_value = "Monthly"
)
# search for series ID matching "UNRATE" and return oldest series first
fredr_series_search_id(
  search_text = "UNRATE",
  order_by = "observation_start"
)
## End(No test)



