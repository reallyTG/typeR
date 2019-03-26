library(RCurl)


### Name: getURL
### Title: Download a URI
### Aliases: getURL getURI getURLContent
### Keywords: IO

### ** Examples


  omegahatExists = url.exists("http://www.omegahat.net")

   # Regular HTTP
  if(omegahatExists) {
     txt = getURL("http://www.omegahat.net/RCurl/")
        # Then we could parse the result.
     if(require(XML))
         htmlTreeParse(txt, asText = TRUE)
  }


        # HTTPS. First check to see that we have support compiled into
        # libcurl for ssl.
  if(interactive() && ("ssl" %in% names(curlVersion()$features))
         && url.exists("https://sourceforge.net/")) {
     txt = tryCatch(getURL("https://sourceforge.net/"),
                    error = function(e) {
                                  getURL("https://sourceforge.net/",
                                            ssl.verifypeer = FALSE)
                              })

  }


     # Create a CURL handle that we will reuse.
  if(interactive() && omegahatExists) {
     curl = getCurlHandle()
     pages = list()
     for(u in c("http://www.omegahat.net/RCurl/index.html",
                "http://www.omegahat.net/RGtk/index.html")) {
         pages[[u]] = getURL(u, curl = curl)
     }
  }


    # Set additional fields in the header of the HTTP request.
    # verbose option allows us to see that they were included.
  if(omegahatExists)
     getURL("http://www.omegahat.net", httpheader = c(Accept = "text/html", 
                                                      MyField = "Duncan"), 
               verbose = TRUE)



    # Arrange to read the header of the response from the HTTP server as
    # a separate "stream". Then we can break it into name-value
    # pairs. (The first line is the HTTP/1.1 200 Ok or 301 Moved Permanently
    # status line)
  if(omegahatExists) {
     h = basicTextGatherer()
     txt = getURL("http://www.omegahat.net/RCurl/index.html",
                  header= TRUE, headerfunction = h$update, 
                  httpheader = c(Accept="text/html", Test=1), verbose = TRUE) 
     print(paste(h$value(NULL)[-1], collapse=""))
     con <- textConnection(paste(h$value(NULL)[-1], collapse=""))
     read.dcf(con)
     close(con)
  }



   # Test the passwords.
  if(omegahatExists) {
     x = getURL("http://www.omegahat.net/RCurl/testPassword/index.html",  userpwd = "bob:duncantl")

       # Catch an error because no authorization
       # We catch the generic HTTPError, but we could catch the more specific "Unauthorized" error
       # type.
      x = tryCatch(getURLContent("http://www.omegahat.net/RCurl/testPassword/index.html"),
                    HTTPError = function(e) {
                                   cat("HTTP error: ", e$message, "\n")
                                })
  }

## Not run: 
##D   #  Needs specific information from the cookie file on a per user basis
##D   #  with a registration to the NY times.
##D   x = getURL("http://www.nytimes.com",
##D                  header = TRUE, verbose = TRUE,
##D                  cookiefile = "/home/duncan/Rcookies",
##D                  netrc = TRUE,
##D                  maxredirs = as.integer(20),
##D                  netrc.file = "/home2/duncan/.netrc1",
##D                  followlocation = TRUE)
## End(Not run)

   if(interactive() && omegahatExists) {
       d = debugGatherer()
       x = getURL("http://www.omegahat.net", debugfunction = d$update, verbose = TRUE)
       d$value()
   }

    #############################################
    #  Using an option set in R

   if(interactive() && omegahatExists) {
      opts = curlOptions(header = TRUE, userpwd = "bob:duncantl", netrc = TRUE)
      getURL("http://www.omegahat.net/RCurl/testPassword/index.html", verbose = TRUE, .opts = opts)

         # Using options in the CURL handle.
      h = getCurlHandle(header = TRUE, userpwd = "bob:duncantl", netrc = TRUE)
      getURL("http://www.omegahat.net/RCurl/testPassword/index.html", verbose = TRUE, curl = h)
   }



   # Use a C routine as the reader. Currently gives a warning.
  if(interactive() && omegahatExists) {
     routine = getNativeSymbolInfo("R_internalWriteTest", PACKAGE = "RCurl")$address
     getURL("http://www.omegahat.net/RCurl/index.html", writefunction = routine)
  }



  # Example
  if(interactive() && omegahatExists) {
     uris = c("http://www.omegahat.net/RCurl/index.html",
              "http://www.omegahat.net/RCurl/philosophy.xml")
     txt = getURI(uris)
     names(txt)
     nchar(txt)

     txt = getURI(uris, async = FALSE)
     names(txt)
     nchar(txt)


     routine = getNativeSymbolInfo("R_internalWriteTest", PACKAGE = "RCurl")$address
     txt = getURI(uris, write = routine, async = FALSE)
     names(txt)
     nchar(txt)


         # getURLContent() for text and binary
     x = getURLContent("http://www.omegahat.net/RCurl/index.html")
     class(x)

     x = getURLContent("http://www.omegahat.net/RCurl/data.gz")
     class(x)
     attr(x, "Content-Type")

     x = getURLContent("http://www.omegahat.net/Rcartogram/demo.jpg")
     class(x)
     attr(x, "Content-Type")


     curl = getCurlHandle()
     dd = getURLContent("http://www.omegahat.net/RJSONIO/RJSONIO.pdf",
                        curl = curl,
                        header = dynCurlReader(curl, binary = TRUE,
                                           value = function(x) {
                                                    print(attributes(x)) 
                                                    x}))
   }



  # FTP
  # Download the files within a directory.
if(interactive() && url.exists('ftp://ftp.wcc.nrcs.usda.gov')) {

   url = 'ftp://ftp.wcc.nrcs.usda.gov/data/snow/snow_course/table/history/idaho/'
   filenames = getURL(url, ftp.use.epsv = FALSE, dirlistonly = TRUE)

      # Deal with newlines as \n or \r\n. (BDR)
      # Or alternatively, instruct libcurl to change \n's to \r\n's for us with crlf = TRUE
      # filenames = getURL(url, ftp.use.epsv = FALSE, ftplistonly = TRUE, crlf = TRUE)
   filenames = paste(url, strsplit(filenames, "\r*\n")[[1]], sep = "")
   con = getCurlHandle( ftp.use.epsv = FALSE)

      # there is a slight possibility that some of the files that are
      # returned in the directory listing and in filenames will disappear
      # when we go back to get them. So we use a try() in the call getURL.
   contents = sapply(filenames[1:5], function(x) try(getURL(x, curl = con)))
   names(contents) = filenames[1:length(contents)]
}
   



