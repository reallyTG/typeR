library(bacistool)


### Name: bacisClassification
### Title: Conduct classification for subgroups.
### Aliases: bacisClassification
### Keywords: bacistool bacistool

### ** Examples


## An example to conduct subgroup classification.

library(bacistool)
result<-bacisClassification(numGroup=5,
                      tau1=NA,
                      tau2=.001,
                      phi1=0.1, phi2=0.3,
                      clusterCutoff = NA,
                      MCNum=5000,
                      nDat=c(25,25,25,25,25),
                      xDat=c(3,4,3,8,7),seed=100)





