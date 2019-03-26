library(fredr)


### Name: fredr_tags
### Title: Get FRED series tags
### Aliases: fredr_tags

### ** Examples

## No test: 
# Information for all tags
fredr_tags()
# Information for just the "gdp" and "oecd" tags
fredr_tags(tag_names = "gdp;oecd")
# Information for all tags in the "geo" group
fredr_tags(tag_group_id = "geo")
# Information for tags matching the text "unemployment"
fredr_tags(search_text = "unemployment")
## End(No test)



