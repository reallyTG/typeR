library(RCurl)


### Name: getBinaryURL
### Title: Download binary content
### Aliases: getBinaryURL
### Keywords: IO programming

### ** Examples

  u = "http://www.omegahat.net/RCurl/data.gz"

if(url.exists(u)) {

  content = getBinaryURL(u)

  if(require(Rcompression)) {
    x = gunzip(content)
    read.csv(textConnection(x))
  } else {
     tmp = tempfile()
     write(content, file = tmp)
     read.csv(gzfile(tmp))
  }


   # Working from the Content-Type in the header of the HTTP response.
  h  = basicTextGatherer()
  content = getBinaryURL(u, .opts = list(headerfunction = h$update))
  header = parseHTTPHeader(h$value())
  type = strsplit(header["Content-Type"], "/")[[1]]

  if(type[2] %in% c("x-gzip", "gzip")) {
    if(require(Rcompression)) 
        x = gunzip(content)
  }

}



