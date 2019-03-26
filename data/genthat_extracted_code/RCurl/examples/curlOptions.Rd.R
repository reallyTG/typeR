library(RCurl)


### Name: curlOptions
### Title: Constructor and accessors for CURLOptions objects
### Aliases: curlOptions getCurlOptionsConstants getCurlOptionTypes
###   listCurlOptions mapCurlOptNames [<-.CURLOptions [[<-.CURLOptions
### Keywords: IO

### ** Examples


 tt = basicTextGatherer()
 myOpts = curlOptions(verbose = TRUE, header = TRUE, writefunc = tt[[1]])

  # note that the names are expanded, e.g. writefunc is now writefunction.
 names(myOpts)

 myOpts[["header"]]

 myOpts[["header"]] <- FALSE

# Using the abbreviation "hea" is an error as it matches
# both 
#  myOpts[["hea"]] <- FALSE

 # Remove the option from the list
 myOpts[["header"]] <- NULL



