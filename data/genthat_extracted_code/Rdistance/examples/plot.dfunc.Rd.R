library(Rdistance)


### Name: plot.dfunc
### Title: Plot a distance (detection) function
### Aliases: plot.dfunc
### Keywords: models

### ** Examples

set.seed(87654)
x <- rnorm(1000, mean=0, sd=20)
x <- x[x >= 0]
dfunc <- dfuncEstim(x~1, likelihood="halfnorm")
plot(dfunc)
plot(dfunc, nbins=25)

# showing effects of plot params
plot(dfunc, col=c("red","blue","orange"), 
 border="black", xlab="Dist (m)", ylab="Prob", 
 vertLines = FALSE, main="Showing plot params")
 
plot(dfunc, col="wheat", density=30, angle=c(-45,0,45), 
cex.axis=1.5, cex.lab=2, ylab="Probability") 

plot(dfunc, col=c("grey","lightgrey"), border=NA) 

plot(dfunc, col="grey", border=0, col.dfunc="blue", 
lty.dfunc = 2, lwd.dfunc=4, vertLines=FALSE)

plot(dfunc, plotBars=FALSE, cex.axis=1.5, col.axis="blue") 
rug(dfunc$dist)




