library(optigrab)


### Name: optigrab
### Title: Optigrab
### Aliases: optigrab optigrab-package
### Keywords: package

### ** Examples


## Not run: 
##D  
##D   opt_get( c("foo","f"))
## End(Not run)

  opts <- c( "--flag", "bar" ) 
  flag <- opt_get( c("foo","f"), opts=opts )  # bar




