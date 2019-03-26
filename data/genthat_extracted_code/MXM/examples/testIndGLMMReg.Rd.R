library(MXM)


### Name: Conditional independence test for longitudinal and clustered data using GLMM
### Title: Linear mixed models conditional independence test for
###   longitudinal class variables
### Aliases: testIndGLMMReg testIndGLMMLogistic testIndGLMMPois
###   testIndGLMMGamma testIndGLMMNormLog testIndGLMMOrdinal testIndGLMMCR
###   testIndLMM
### Keywords: Linear mixed model Conditional independence test

### ** Examples

y <- rnorm(150)
x <- matrix(rnorm(150 * 5), ncol = 5)
id <- sample(1:20, 150, replace = TRUE)
testIndGLMMReg(y, group=id, dataset=x, xIndex=1, csIndex=3)
testIndLMM(y, group=id, dataset=x, xIndex=1, csIndex=3)



