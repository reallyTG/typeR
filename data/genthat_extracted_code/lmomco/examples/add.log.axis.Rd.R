library(lmomco)


### Name: add.log.axis
### Title: Add a Polished log Axis to a Plot
### Aliases: add.log.axis
### Keywords: utility (logarithmic) axis (utility) Graphics The lmomco
###   functions

### ** Examples

## Not run: 
##D par(mgp=c(3,0.5,0)) # going to tick to the inside, change some parameters
##D X <- 10^sort(rnorm(65)); pp <- pp(X) # generate synthetic data
##D ylim <- add.log.axis(x=X) # snap to some nice integers within the cycle
##D plot(qnorm(pp), X, xaxt="n", yaxt="n", xlab="", ylab="", log="y",
##D      xlim=c(-2,3), ylim=ylim, pch=6, yaxs="i", col=4)
##D add.lmomco.axis(las=2, tcl=0.5, side.type="RI", otherside.type="NPP")
##D # Logarithmic axis: the base ticks to show logarithms
##D add.log.axis(side=2,      tcl=0.8*abs(par()$tcl), two.sided=TRUE)
##D #                   the long even-cycle tick, set to inside and outside
##D add.log.axis(logs=c(1),   tcl=-0.5*abs(par()$tcl), side=2, two.sided=TRUE)
##D add.log.axis(logs=c(1),   tcl=+1.3*abs(par()$tcl), side=2, two.sided=TRUE)
##D #                   now a micro tick at the 1.5 logs but only on the right
##D add.log.axis(logs=c(1.5), tcl=+0.5*abs(par()$tcl), side=4)
##D #                   and only label the micro tick at 1.5 on the right
##D add.log.axis(logs=c(1.5), side=4, make.labs=TRUE, las=3) # but weird rotate
##D #                   add the bulk tick labeling and axis label.
##D add.log.axis(logs=c(1, 2, 3, 4, 6), side=2, make.labs=TRUE, las=1, label="QUANTILE")
##D par(mgp=c(3,1,0)) # restore defaults
## End(Not run)



