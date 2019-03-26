library(VineCopula)


### Name: ddCopula
### Title: Partial Derivatives of Copulas
### Aliases: ddCopula dduCopula ddvCopula
### Keywords: conditional derivative partial probabilities

### ** Examples


library(copula)

BB1Cop <- BB1Copula()
BB1CopSmpl <- rCopula(100, BB1Cop)

# conditional probabilities of a Gaussian copula given u
BB1GivenU <- dduCopula(BB1CopSmpl, BB1Cop)

# vs. conditional probabilities of a Gaussian copula given v
BB1GivenV <- ddvCopula(BB1CopSmpl[,c(2,1)], BB1Cop)

plot(BB1GivenU, BB1GivenV)
abline(0,1)




