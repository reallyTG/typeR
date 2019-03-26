library(randomizeR)


### Name: doublyTValues
### Title: Calculation of the biased type-one-error (resp. power) of
###   Student's t-test
### Aliases: doublyTValues

### ** Examples

myPar <- crPar(4)
M <- getAllSeq(myPar)
cs <- selBias("CS", 1, "exact")
endp <- normEndp(mu = c(0, 0), sigma = c(1, 1))
doublyTValues(M, cs, endp)




