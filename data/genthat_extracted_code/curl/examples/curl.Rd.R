library(curl)


### Name: curl
### Title: Curl connection interface
### Aliases: curl

### ** Examples

## Not run: 
##D con <- curl("https://httpbin.org/get")
##D readLines(con)
##D 
##D # Auto-opened connections can be recycled
##D open(con, "rb")
##D bin <- readBin(con, raw(), 999)
##D close(con)
##D rawToChar(bin)
##D 
##D # HTTP error
##D curl("https://httpbin.org/status/418", "r")
##D 
##D # Follow redirects
##D readLines(curl("https://httpbin.org/redirect/3"))
##D 
##D # Error after redirect
##D curl("https://httpbin.org/redirect-to?url=http://httpbin.org/status/418", "r")
##D 
##D # Auto decompress Accept-Encoding: gzip / deflate (rfc2616 #14.3)
##D readLines(curl("http://httpbin.org/gzip"))
##D readLines(curl("http://httpbin.org/deflate"))
##D 
##D # Binary support
##D buf <- readBin(curl("http://httpbin.org/bytes/98765", "rb"), raw(), 1e5)
##D length(buf)
##D 
##D # Read file from disk
##D test <- paste0("file://", system.file("DESCRIPTION"))
##D readLines(curl(test))
##D 
##D # Other protocols
##D read.csv(curl("ftp://cran.r-project.org/pub/R/CRAN_mirrors.csv"))
##D readLines(curl("ftps://test.rebex.net:990/readme.txt"))
##D readLines(curl("gopher://quux.org/1"))
##D 
##D # Streaming data
##D con <- curl("http://jeroen.github.io/data/diamonds.json", "r")
##D while(length(x <- readLines(con, n = 5))){
##D   print(x)
##D }
##D 
##D # Stream large dataset over https with gzip
##D library(jsonlite)
##D con <- gzcon(curl("https://jeroen.github.io/data/nycflights13.json.gz"))
##D nycflights <- stream_in(con)
## End(Not run)




