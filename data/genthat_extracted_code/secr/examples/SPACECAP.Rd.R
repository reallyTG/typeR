library(secr)


### Name: SPACECAP
### Title: Exchange data with SPACECAP package
### Aliases: read.SPACECAP write.SPACECAP
### Keywords: IO

### ** Examples

## Not run: 
##D 
##D ## coerce data to proximity detector type for export
##D demo <- reduce(captdata, output = "proximity") 
##D write.SPACECAP (demo, filestem = "demo")
##D 
##D ## now read back the data just exported...
##D temp <- read.SPACECAP ("demoAC.csv", "demoTD.csv")
##D temp <- reduce(temp, output = "multi")
##D summary (temp)
##D summary (captdata)
##D 
##D ## should match exactly
##D identical(summary(temp), summary(captdata))
##D 
## End(Not run)



