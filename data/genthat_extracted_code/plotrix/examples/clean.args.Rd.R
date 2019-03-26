library(plotrix)


### Name: clean.args
### Title: Remove inappropriate arguments from an argument list
### Aliases: clean.args remove.args
### Keywords: programming

### ** Examples

 tststr <- list(n=2,mean=0,sd=1,foo=4,bar=6) 
 clean.args(tststr,rnorm)
 try(do.call("rnorm",tststr))
 do.call("rnorm",clean.args(tststr,rnorm))
 remove.args(tststr,rnorm)
 ## add example of combining arg. lists?



