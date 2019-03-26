library(lmomco)


### Name: add.lmomco.axis
### Title: Add an lmomco Axis to a Plot
### Aliases: add.lmomco.axis
### Keywords: utility (probability) axis (utility) Graphics The lmomco
###   functions

### ** Examples

par(mgp=c(3,0.5,0)) # going to tick to the inside, change some parameters
X <- sort(rnorm(65)); pp <- pp(X) # generate synthetic data
plot(qnorm(pp), X, xaxt="n", xlab="", ylab="QUANTILE", xlim=c(-2,3))
add.lmomco.axis(las=2, tcl=0.5, side.type="RI", otherside.type="NPP")
par(mgp=c(3,1,0)) # restore defaults

## Not run: 
##D opts <- options(scipen=6); par(mgp=c(3,0.5,0))
##D X <- sort(rexp(65, rate=.0001))*100; pp <- pp(X) # generate synthetic data
##D plot(qnorm(pp), X, yaxt="n", xaxt="n", xlab="", ylab="", log="y")
##D add.log.axis(side=2,    tcl=+0.8*abs(par()$tcl),         two.sided=TRUE)
##D add.log.axis(logs=c(1), tcl=-0.5*abs(par()$tcl), side=2, two.sided=TRUE)
##D add.log.axis(logs=c(1), tcl=+1.3*abs(par()$tcl), side=2, two.sided=TRUE)
##D add.log.axis(logs=1:8, side=2, make.labs=TRUE, las=1, label="QUANTILE")
##D add.lmomco.axis(las=2, tcl=0.5, side.type="NPP", npp.as.aep=TRUE, case="lower")
##D options(opts)
##D par(mgp=c(3,1,0)) # restore defaults
## End(Not run)



