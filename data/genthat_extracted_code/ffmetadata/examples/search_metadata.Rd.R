library(ffmetadata)


### Name: search_metadata
### Title: Search Metadata
### Aliases: search_metadata

### ** Examples

search_test1 <- search_metadata(wave = "Year 1")

search_test2 <- search_metadata(wave = "Year 1", respondent = "Mother")

search_test3 <- search_metadata(wave = "Year 1", name = "f%", operation = c("eq", "like"))

search_test4 <- search_metadata(name = "f1%", operation = "like")

# Note that when using operators checking for null values (or lack thereof), the operation
# parameter should not be included in the call. It should be formatted instead like so:
search_test5 <- search_metadata(qtext = "is_null")



