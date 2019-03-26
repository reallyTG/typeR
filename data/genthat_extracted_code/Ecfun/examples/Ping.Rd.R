library(Ecfun)


### Name: Ping
### Title: ping a Uniform resource locator (URL)
### Aliases: Ping
### Keywords: IO

### ** Examples

##
## Some ISPs play games with ping.
## Therefore, the results are not reliable.
##
## Not run: 
##D ##
##D ## good
##D ##
##D (google <- Ping('http://google.com/ping works on host not pages'))
##D 
##D \dontshow{stopifnot(}
##D with(google, (counts[1]>0) && (counts[3]<1))
##D \dontshow{)}
##D 
##D ##
##D ## ping oops <<-- at one time, this failed.
##D ##      However, with some ISPs, it works, so don't test it.
##D ##
##D 
##D ##
##D (couldnotfindhost <- Ping('oops'))
##D 
##D \dontshow{stopifnot(}
##D with(couldnotfindhost,
##D      length(grep('could not find host', rawResults))>0)
##D \dontshow{)}
##D 
##D ##
##D ## impossible, but not so obvious
##D ##
##D (requesttimedout <- Ping('requesttimedout.com'))
##D 
##D \dontshow{stopifnot(}
##D with(requesttimedout, (counts[1]>0) && (counts[2]<1) &&
##D          (counts[3]>0))
##D \dontshow{)}
## End(Not run)



