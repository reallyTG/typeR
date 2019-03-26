library(randomizeR)


### Name: getExpectation
### Title: Get expectations of a randomization list
### Aliases: getExpectation getExpectation
###   getExpectation,randSeq,missing,normEndp-method
###   getExpectation,randSeq,power,normEndp-method
###   getExpectation,randSeq,chronBias,normEndp-method
###   getExpectation,randSeq,chronBias,missing-method
###   getExpectation,randSeq,selBias,normEndp-method
###   getExpectation,randSeq,selBias,missing-method
###   getExpectation,randSeq,combinedBias,normEndp-method
###   getExpectation,randSeq,combinedBiasStepTrend,normEndp-method

### ** Examples

myPar <- bsdPar(10, 2)
M <- genSeq(myPar, 2)
cs <- selBias("CS", 2, "sim")
endp <- normEndp(mu = c(2, 2), sigma = c(1, 1))
getExpectation(M, cs, endp)




