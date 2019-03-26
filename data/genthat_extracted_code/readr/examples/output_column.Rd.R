library(readr)


### Name: output_column
### Title: Preprocess column for output
### Aliases: output_column
### Keywords: internal

### ** Examples

# Most columns are left as is, but POSIXct are
# converted to ISO8601.
x <- parse_datetime("2016-01-01")
str(output_column(x))



