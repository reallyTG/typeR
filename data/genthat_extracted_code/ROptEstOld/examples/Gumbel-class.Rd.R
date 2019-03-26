library(ROptEstOld)


### Name: Gumbel-class
### Title: Gumbel distribution
### Aliases: Gumbel-class initialize,Gumbel-method loc,Gumbel-method
###   loc<-,Gumbel-method scale,Gumbel-method scale<-,Gumbel-method
###   +,Gumbel,numeric-method *,Gumbel,numeric-method E E-methods
###   E,Gumbel,missing,missing-method var var-methods var,Gumbel-method
###   skewness skewness-methods skewness,Gumbel-method kurtosis
###   kurtosis-methods kurtosis,Gumbel-method
### Keywords: distribution

### ** Examples

(G1 <- new("Gumbel", loc = 1, scale = 2))
plot(G1)
loc(G1)
scale(G1)
loc(G1) <- -1
scale(G1) <- 2
plot(G1)



