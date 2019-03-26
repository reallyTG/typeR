library(fredr)


### Name: fredr_series_search_related_tags
### Title: Get the related FRED tags for one or more FRED tags matching a
###   series search
### Aliases: fredr_series_search_related_tags

### ** Examples

## No test: 
# Search for all tags matching the series text "oil" and the tag "usa".
fredr_series_search_related_tags(
  series_search_text = "oil",
  tag_names = "usa"
)
# Search for tags matching the series text "oil", the tag text "usa", and
# are related to the tag "usa".  Return only results in the "src" (Source)
# group.
fredr_series_search_related_tags(
  series_search_text = "oil",
  tag_names = "usa",
  tag_group_id = "src",
  tag_search_text = "usa"
)
## End(No test)



