library(randomizeR)


### Name: getProbabilities
### Title: Theoretical probability for randomization sequences
### Aliases: getProbabilities calculateProbabilities calcProb getProb
###   getProb,abcdSeq-method getProb,bbcdSeq-method getProb,bsdSeq-method
###   getProb,chenSeq-method getProb,crSeq-method getProb,ebcSeq-method
###   getProb,gbcdSeq-method getProb,hadaSeq-method getProb,mpSeq-method
###   getProb,pbrSeq-method getProb,rarSeq-method getProb,tbdSeq-method
###   getProb,udSeq-method

### ** Examples

myPar <- bsdPar(10, 2)
M <- genSeq(myPar, 2)
getProb(M)

# All Sequences
par <- pbrPar(bc=c(2,2))
refSet <- getAllSeq(myPar)
probs <- getProb(refSet)

# Sequences with probabilities
cbind(probs, refSet$M)




