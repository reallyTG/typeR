library(jsonlite)


### Name: read_json
### Title: Read/write JSON
### Aliases: read_json parse_json write_json

### ** Examples

tmp <- tempfile()
write_json(iris, tmp)

# Nested lists
read_json(tmp)

# A data frame
read_json(tmp, simplifyVector = TRUE)



