library(HiddenMarkov)


### Name: mchain
### Title: Markov Chain Object
### Aliases: mchain
### Keywords: classes

### ** Examples

Pi <- matrix(c(0.8, 0.2,
               0.3, 0.7),
             byrow=TRUE, nrow=2)

#    Create a Markov chain object with no data (NULL)
x <- mchain(NULL, Pi, c(0,1))

#    Simulate some data
x <- simulate(x, nsim=2000)

#   estimate transition probabilities
estPi <- table(x$mc[-length(x$mc)], x$mc[-1])
rowtotal <- estPi %*% matrix(1, nrow=nrow(Pi), ncol=1)
estPi <- diag(as.vector(1/rowtotal)) %*% estPi
print(estPi)



