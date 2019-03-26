library(jsonlite)


### Name: toJSON, fromJSON
### Title: Convert R objects to/from JSON
### Aliases: 'toJSON, fromJSON' fromJSON toJSON jsonlite

### ** Examples

# Stringify some data
jsoncars <- toJSON(mtcars, pretty=TRUE)
cat(jsoncars)

# Parse it back
fromJSON(jsoncars)

# Parse escaped unicode
fromJSON('{"city" : "Z\\u00FCrich"}')

# Decimal vs significant digits
toJSON(pi, digits=3)
toJSON(pi, digits=I(3))

## Not run: 
##D #retrieve data frame
##D data1 <- fromJSON("https://api.github.com/users/hadley/orgs")
##D names(data1)
##D data1$login
##D 
##D # Nested data frames:
##D data2 <- fromJSON("https://api.github.com/users/hadley/repos")
##D names(data2)
##D names(data2$owner)
##D data2$owner$login
##D 
##D # Flatten the data into a regular non-nested dataframe
##D names(flatten(data2))
##D 
##D # Flatten directly (more efficient):
##D data3 <- fromJSON("https://api.github.com/users/hadley/repos", flatten = TRUE)
##D identical(data3, flatten(data2))
## End(Not run)



