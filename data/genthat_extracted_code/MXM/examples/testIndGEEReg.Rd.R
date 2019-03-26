library(MXM)


### Name: Conditional independence test for longitudinal and clustered data using GEE
### Title: Linear mixed models conditional independence test for
###   longitudinal class variables
### Aliases: testIndGEEReg testIndGEELogistic testIndGEEPois
###   testIndGEEGamma testIndGEENormLog

### ** Examples

library("geepack", quietly = TRUE)
y <- rnorm(150)
x <- matrix(rnorm(150 * 5), ncol = 5)
id <- sample(1:20, 150, replace = TRUE)
testIndGEEReg(y, group=id, dataset=x, xIndex=1, csIndex=3)



