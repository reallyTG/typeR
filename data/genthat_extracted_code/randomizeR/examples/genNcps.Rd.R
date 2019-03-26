library(randomizeR)


### Name: genNcps
### Title: Calculation of the NCPs of each randomization sequence for the
###   doubly noncentral t-distribution
### Aliases: genNcps

### ** Examples

myPar <- crPar(4)
M <- getAllSeq(myPar)
cs <- selBias("CS", 1, "exact")
endp <- normEndp(mu = c(0, 0), sigma = c(1, 1))
genNcps(M, cs, endp)




