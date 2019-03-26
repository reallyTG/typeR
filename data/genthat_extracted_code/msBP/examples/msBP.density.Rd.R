library(msBP)


### Name: msBP.pdf
### Title: Random probability density function and random cumulative
###   distribution function from a msBP
### Aliases: msBP.pdf msBP.cdf

### ** Examples

prob <-structure(list( T = list(0.15, c(0.05,0.05), c(0.05,0.2,0.1,0.1), 
		c(0,0,0.3,0,0,0,0,0) ), max.s=3), class  = "binaryTree")
density <- msBP.pdf(prob, 100)
probability <- msBP.cdf(prob, 100)
par(mfrow=c(1,2))
plot(density$dens~density$y, ty='l', main = "pdf")
plot(probability$prob~density$y, ty='l', main = "cdf")



