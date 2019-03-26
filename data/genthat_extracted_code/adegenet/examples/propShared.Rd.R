library(adegenet)


### Name: propShared
### Title: Compute proportion of shared alleles
### Aliases: propShared
### Keywords: manip multivariate

### ** Examples


## Not run: 
##D ## make a small object
##D data(microbov)
##D obj <- microbov[1:5, loc = locNames(microbov)[1:2]]
##D 
##D ## verify results
##D propShared(obj)
##D genind2df(obj,sep="|")
##D 
##D ## Use this similarity measure inside a PCoA
##D ##  ! This is for illustration only !
##D ## the distance should be rendered Euclidean before
##D ## (e.g. using cailliez from package ade4).
##D matSimil <- propShared(microbov)
##D matDist <- exp(-matSimil)
##D D <- cailliez(as.dist(matDist))
##D pcoa1 <- dudi.pco(D,scannf=FALSE,nf=3)
##D s.class(pcoa1$li,microbov$pop,lab=popNames(microbov))
##D 
## End(Not run)



