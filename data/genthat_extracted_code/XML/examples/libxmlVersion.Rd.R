library(XML)


### Name: libxmlVersion
### Title: Query the version and available features of the libxml library.
### Aliases: libxmlVersion libxmlFeatures
### Keywords: IO

### ** Examples

 ver <- libxmlVersion()
 if(is.null(ver)) {
   cat("Relly old version of libxml\n")
 } else {
   if(ver$major > 1) {
     cat("Using libxml2\n")
   }
 }



