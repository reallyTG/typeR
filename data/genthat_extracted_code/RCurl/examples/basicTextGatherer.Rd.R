library(RCurl)


### Name: basicTextGatherer
### Title: Cumulate text across callbacks (from an HTTP response)
### Aliases: basicTextGatherer multiTextGatherer debugGatherer
### Keywords: IO

### ** Examples

if(url.exists("http://www.omegahat.net/RCurl/index.html")) {
  txt = getURL("http://www.omegahat.net/RCurl/index.html", write = basicTextGatherer())

  h = basicTextGatherer()
  txt = getURL("http://www.omegahat.net/RCurl/index.html", write = h$update)
    # Cumulate across pages.
  txt = getURL("http://www.omegahat.net/index.html", write = h$update)


  headers = basicTextGatherer()
  txt = getURL("http://www.omegahat.net/RCurl/index.html",
               header = TRUE, headerfunction = headers$update)

     # Now read the headers.
  headers$value()
  headers$reset()


    # Debugging callback
  d = debugGatherer()
  x = getURL("http://www.omegahat.net/RCurl/index.html", debugfunction = d$update, verbose = TRUE)
  names(d$value())
  d$value()[["headerIn"]]


  uris = c("http://www.omegahat.net/RCurl/index.html",
           "http://www.omegahat.net/RCurl/philosophy.html")
  g = multiTextGatherer(uris)
  txt = getURIAsynchronous(uris,  write = g)
  names(txt)
  nchar(txt)

   # Now don't use names for the gatherer elements.
  g = multiTextGatherer(length(uris))
  txt = getURIAsynchronous(uris,  write = g)
  names(txt)
  nchar(txt)
}


## Not run: 
##D  Sys.setlocale(,"en_US.latin1")
##D  Sys.setlocale(,"en_US.UTF-8")
##D  uris = c("http://www.omegahat.net/RCurl/index.html",
##D           "http://www.omegahat.net/RCurl/philosophy.html")
##D  g = multiTextGatherer(uris)
##D  txt = getURIAsynchronous(uris,  write = g)
## End(Not run)



