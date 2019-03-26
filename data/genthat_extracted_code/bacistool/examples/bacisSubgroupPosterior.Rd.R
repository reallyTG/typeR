library(bacistool)


### Name: bacisSubgroupPosterior
### Title: Compute the posterior distribution of response rates of
###   subgroups using the BaCIS method.
### Aliases: bacisSubgroupPosterior
### Keywords: bacistool bacistool

### ** Examples


## Compute the response rate posterior distributioni
## of each subgroup using the BaCIS method
## Not run: 
##D library(bacistool)
##D result<-bacisSubgroupPosterior(numGroup=5,
##D                                tau1=NA,
##D                                tau2=.001,
##D                                phi1=0.1, phi2=0.3,
##D                                tau4=0.1,
##D                                alpha=50,
##D                                beta=20,
##D                                clusterCutoff=NA,
##D                                MCNum=5000,
##D                                nDat=c(25,25,25,25,25),
##D                                xDat=c(3,4,3,8,7))
##D 
##D 
## End(Not run)



