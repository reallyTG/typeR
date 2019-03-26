library(ApacheLogProcessor)


### Name: clear.urls
### Title: Clear a list of URLs according parameters.
### Aliases: clear.urls

### ** Examples


#Load the path to the log file
path_combined = system.file("examples", "access_log_combined.txt", package = "ApacheLogProcessor")

#Read a log file with combined format and return it in a data frame
df1 = read.apache.access.log(path_combined)

#Clear the urls
urls <- clear.urls(df1$url)

#Clear the urls but do not remove query strings
urlsWithQS <- clear.urls(df1$url, remove_query_string = FALSE)

#Load a log which the urls have parameters inside
path2 = system.file("examples", 
"access_log_with_params_inside_url.txt", package = "ApacheLogProcessor")

#Read a log file with combined format and return it in a data frame
df2 = read.apache.access.log(path2, format = "common")

#Clear the urls with parameters inside
urls2 <- clear.urls(df2$url)




