library(bacistool)


### Name: bacisThetaPosterior
### Title: Compute the posterior distribution of theta in the
###   classification model.
### Aliases: bacisThetaPosterior
### Keywords: bacistool bacistool

### ** Examples


## Conduct subgroup classification and
## compute the posterior distribution of \eqn{\theta}.

library(bacistool)
result<-bacisThetaPosterior(numGroup=5,
                      tau1=NA,
                      tau2=.001,
                      phi1=0.1, phi2=0.3,
                      MCNum=5000,
                      nDat=c(25,25,25,25,25),
                      xDat=c(3,4,3,8,7)
)




