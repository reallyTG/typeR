library(nopaco)


### Name: getPsi
### Title: Obtain concordance coefficients.
### Aliases: getPsi getPsi,ConcordanceTest,missing-method
###   getPsi,matrix,missing-method getPsi,data.frame,missing-method
###   getPsi,data.frame,data.frame-method getPsi,matrix,NULL-method
###   getPsi,matrix,matrix-method

### ** Examples


matRandom <- matrix(rnorm(30),10,3)
testResult <- concordance.test(matRandom)
getPsi(testResult)
getPsi(matRandom)



