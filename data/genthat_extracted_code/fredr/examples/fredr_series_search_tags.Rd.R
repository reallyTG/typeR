library(fredr)


### Name: fredr_series_search_tags
### Title: Get the FRED tags for a series search.
### Aliases: fredr_series_search_tags

### ** Examples

## No test: 
# Search for tags matching the series text "gnp"
fredr_series_search_tags("gnp")
# Search for tags matching the series text "oil" and the tag text "usa"
fredr_series_search_tags(
  series_search_text = "oil",
  tag_search_text = "usa"
)
# Search for tags matching the series text "oil" and the tag text "usa".
# Return only results in the "geo" (Geography) group
fredr_series_search_tags(
  series_search_text = "oil",
  tag_group_id = "geo",
  tag_search_text = "usa"
)
## End(No test)



