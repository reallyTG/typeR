library(robmixglm)


### Name: print.outlierTest
### Title: Print an outlierTest object
### Aliases: print.outlierTest summary.outlierTest
###   print.summary.outlierTest
### Keywords: methods

### ** Examples

## No test: 
library(MASS)
data(forbes)
forbes.robustmix <- robmixglm(bp~pres,data=forbes)
summary(forbes.robustmix)
print(outlierTest(forbes.robustmix))
## End(No test)



