library(gap)


### Name: pfc.sim
### Title: Probability of familial clustering of disease
### Aliases: pfc.sim
### Keywords: models

### ** Examples

## Not run: 
##D # Li FP, Fraumeni JF Jr, Mulvihill JJ, Blattner WA, Dreyfus MG, Tucker MA,
##D # Miller RW. A cancer family syndrome in twenty-four kindreds.
##D # Cancer Res 1988, 48(18):5358-62. 
##D 
##D # family_size  #_of_affected frequency
##D 
##D famtest<-c(
##D 1, 0, 2,
##D 1, 1, 0,
##D 2, 0, 1,
##D 2, 1, 4,
##D 2, 2, 3,
##D 3, 0, 0,
##D 3, 1, 2,
##D 3, 2, 1,
##D 3, 3, 1,
##D 4, 0, 0,
##D 4, 1, 2,
##D 5, 0, 0,
##D 5, 1, 1,
##D 6, 0, 0,
##D 6, 1, 1,
##D 7, 0, 0,
##D 7, 1, 1,
##D 8, 0, 0,
##D 8, 1, 1,
##D 8, 2, 1,
##D 8, 3, 1,
##D 9, 3, 1)
##D 
##D test<-matrix(famtest,byrow=T,ncol=3)
##D 
##D famp<-pfc.sim(test)
## End(Not run)



