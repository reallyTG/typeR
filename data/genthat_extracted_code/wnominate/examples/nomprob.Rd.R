library(wnominate)


### Name: nomprob
### Title: NOMINATE Probability Matrix Generator
### Aliases: nomprob
### Keywords: multivariate

### ** Examples


    yp <- matrix(rep(0,10),nrow=10)
    np <- matrix(rep(0.1,10),nrow=10)
    ideal <- matrix(rep(0,10),nrow=10)
    nomprob(yp,np,ideal,15,0.5)    #a matrix of yea probabilities




