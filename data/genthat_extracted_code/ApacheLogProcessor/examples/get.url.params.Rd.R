library(ApacheLogProcessor)


### Name: get.url.params
### Title: Extract from the data frame with the access log the urls query
###   strings parameters and values.
### Aliases: get.url.params

### ** Examples

#Load a log which the urls have query strings
path = system.file("examples", "access_log_with_query_string.log", package = "ApacheLogProcessor")

#Read a log file with combined format and return it in a data frame
df = read.apache.access.log(path, format = "common")

#Clear the urls with parameters inside
params <- get.url.params(df)




