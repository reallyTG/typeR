library(jsonlite)


### Name: stream_in, stream_out
### Title: Streaming JSON input/output
### Aliases: 'stream_in, stream_out' stream_in stream_out

### ** Examples

# compare formats
x <- iris[1:3,]
toJSON(x)
stream_out(x)

# Trivial example
mydata <- stream_in(url("http://httpbin.org/stream/100"))

## Not run: 
##D stream large dataset to file and back
##D library(nycflights13)
##D stream_out(flights, file(tmp <- tempfile()))
##D flights2 <- stream_in(file(tmp))
##D unlink(tmp)
##D all.equal(flights2, as.data.frame(flights))
##D 
##D # stream over HTTP
##D diamonds2 <- stream_in(url("http://jeroen.github.io/data/diamonds.json"))
##D 
##D # stream over HTTP with gzip compression
##D flights3 <- stream_in(gzcon(url("http://jeroen.github.io/data/nycflights13.json.gz")))
##D all.equal(flights3, as.data.frame(flights))
##D 
##D # stream over HTTPS (HTTP+SSL) via curl
##D library(curl)
##D flights4 <- stream_in(gzcon(curl("https://jeroen.github.io/data/nycflights13.json.gz")))
##D all.equal(flights4, as.data.frame(flights))
##D 
##D # or alternatively:
##D flights5 <- stream_in(gzcon(pipe("curl https://jeroen.github.io/data/nycflights13.json.gz")))
##D all.equal(flights5, as.data.frame(flights))
##D 
##D # Full JSON IO stream from URL to file connection.
##D # Calculate delays for flights over 1000 miles in batches of 5k
##D library(dplyr)
##D con_in <- gzcon(url("http://jeroen.github.io/data/nycflights13.json.gz"))
##D con_out <- file(tmp <- tempfile(), open = "wb")
##D stream_in(con_in, handler = function(df){
##D   df <- dplyr::filter(df, distance > 1000)
##D   df <- dplyr::mutate(df, delta = dep_delay - arr_delay)
##D   stream_out(df, con_out, pagesize = 1000)
##D }, pagesize = 5000)
##D close(con_out)
##D 
##D # stream it back in
##D mydata <- stream_in(file(tmp))
##D nrow(mydata)
##D unlink(tmp)
##D 
##D # Data from http://openweathermap.org/current#bulk
##D # Each row contains a nested data frame.
##D daily14 <- stream_in(gzcon(url("http://78.46.48.103/sample/daily_14.json.gz")), pagesize=50)
##D subset(daily14, city$name == "Berlin")$data[[1]]
##D 
##D # Or with dplyr:
##D library(dplyr)
##D daily14f <- flatten(daily14)
##D filter(daily14f, city.name == "Berlin")$data[[1]]
##D 
##D # Stream import large data from zip file
##D tmp <- tempfile()
##D download.file("http://jsonstudio.com/wp-content/uploads/2014/02/companies.zip", tmp)
##D companies <- stream_in(unz(tmp, "companies.json"))
## End(Not run)



