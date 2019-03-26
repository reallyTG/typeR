library(mixtools)


### Name: npMSL
### Title: Nonparametric EM-like Algorithm for Mixtures of Independent
###   Repeated Measurements - Maximum Smoothed Likelihood version
### Aliases: npMSL
### Keywords: file

### ** Examples

## Examine and plot water-level task data set.
## Block structure pairing clock angles that are directly opposite one
## another (1:00 with 7:00, 2:00 with 8:00, etc.)
set.seed(111) # Ensure that results are exactly reproducible
data(Waterdata)
blockid <- c(4,3,2,1,3,4,1,2) # see Benaglia et al (2009a)

## Not run: 
##D a <- npEM(Waterdata[,3:10], mu0=3, blockid=blockid, bw=4)  # npEM solution
##D b <- npMSL(Waterdata[,3:10], mu0=3, blockid=blockid, bw=4) # smoothed version
##D 
##D # Comparisons on the 4 default plots, one for each block
##D par(mfrow=c(2,2))
##D for (l in 1:4){
##D plot(a, blocks=l, breaks=5*(0:37)-92.5,
##D 	xlim=c(-90,90), xaxt="n",ylim=c(0,.035), xlab="")
##D plot(b, blocks=l, hist=FALSE, newplot=FALSE, addlegend=FALSE, lty=2,
##D 	dens.col=1)
##D axis(1, at=30*(1:7)-120, cex.axis=1)
##D legend("topleft",c("npMSL"),lty=2, lwd=2)}
## End(Not run)




