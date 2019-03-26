library(simsalapar)


### Name: subjob
### Title: Subjob - Compute one Row of the Virtual Grid
### Aliases: printInfo subjob
### Keywords: utilities

### ** Examples

names(printInfo)# currently "default", "gfile", "fileEach"
## Don't show: 
if(need.U <- !any("package:utils" == search())) library(utils)
## End(Don't show)
str(printInfo, give.attr=FALSE)
## the functions in printInfo share a common environment() with utility functions:
ls.str(environment(printInfo$default))
if(FALSE) # show them all
as.list(environment(printInfo$default))



