library(oce)


### Name: subset,amsr-method
### Title: Subset an amsr Object
### Aliases: subset,amsr-method

### ** Examples

## Not run: 
##D library(oce)
##D earth <- read.amsr("f34_20160102v7.2.gz") # not provided with oce
##D fclat <- subset(earth , 45<=latitude & latitude <= 49)
##D fc <- subset(fclat , longitude <= -47 & longitude <= -43)
##D plot(fc)
## End(Not run)



