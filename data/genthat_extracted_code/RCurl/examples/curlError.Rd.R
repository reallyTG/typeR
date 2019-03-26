library(RCurl)


### Name: curlError
### Title: Raise a warning or error about a CURL problem
### Aliases: curlError
### Keywords: programming IO

### ** Examples

  # This illustrates generating and catching an error.
  # We intentionally give a mis-spelled URL.
 tryCatch(curlPerform(url = "ftp.wcc.nrcs.usda.govx"),
          COULDNT_RESOLVE_HOST = function(x) cat("resolve problem\n"),
          error = function(x) cat(class(x), "got it\n"))



