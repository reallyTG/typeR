library(spatstat)


### Name: scanLRTS
### Title: Likelihood Ratio Test Statistic for Scan Test
### Aliases: scanLRTS
### Keywords: htest spatial

### ** Examples

   plot(scanLRTS(redwood, 0.1, method="poisson"))
   sc <- scanLRTS(chorley, 1, method="binomial", case="larynx") 
   plot(sc)
   scanstatchorley <- max(sc)



