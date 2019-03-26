library(securitytxt)


### Name: sectxt
### Title: Parse a 'security.txt' Web Security Policies file & create a
###   'sectxt' object
### Aliases: sectxt

### ** Examples

sectxt(readLines(system.file("extdata", "security.txt", package="securitytxt")))
## Not run: 
##D sectxt(url(sectxt_url("https://securitytxt.org")))
## End(Not run)



