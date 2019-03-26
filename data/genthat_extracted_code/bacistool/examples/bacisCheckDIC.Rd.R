library(bacistool)


### Name: bacisCheckDIC
### Title: Compute the DIC value for the classification model.
### Aliases: bacisCheckDIC
### Keywords: bacistool bacistool

### ** Examples

## An example to compute the DIC value.
library(bacistool)
result<-bacisCheckDIC(numGroup=5,
                      tau1=NA,
                      tau2=.001,
                      phi1=0.1, phi2=0.3,
                      MCNum=5000,
                      nDat=c(25,25,25,25,25),
                      xDat=c(3,4,3,8,7),
                      seed=100
                      )




