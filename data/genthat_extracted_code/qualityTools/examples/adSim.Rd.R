library(qualityTools)


### Name: adSim
### Title: Bootstrap-based Anderson-Darling Test for Univariate
###   Distributions
### Aliases: adSim
### Keywords: Anderson-Darling Test Bootstrap

### ** Examples

x <- rnorm(25,32,2)
adSim(x)
adSim(x,"logistic",2000)
adSim(x,"cauchy",NA)


