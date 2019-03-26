library(fredr)


### Name: fredr_tags_series
### Title: Find FRED series matching tag names
### Aliases: fredr_tags_series

### ** Examples


## No test: 
# All series tagged with "gdp"
fredr_tags_series(tag_names = "gdp")
# All series tagged with "gdp" and not tagged with "quarterly"
fredr_tags_series(
   tag_names = "gdp",
   exclude_tag_names = "quarterly"
 )
# Top 100 most popular non-quarterly series matching GDP
fredr_tags_series(
   tag_names = "gdp",
   exclude_tag_names = "quarterly",
   order_by = "popularity",
   limit = 100L
)
## End(No test)



