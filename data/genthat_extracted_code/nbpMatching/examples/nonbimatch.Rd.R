library(nbpMatching)


### Name: nonbimatch
### Title: Nonbipartite Matching
### Aliases: nonbimatch nonbimatch,distancematrix-method nonbimatch-class

### ** Examples


plainmatrix<-as.matrix(dist(sample(1:25, 8, replace=TRUE)))
diag(plainmatrix) <- 99999  # setting diagonal to an infinite distance for
                           # pedagogical reasons (the diagonal may be left
                           # as zero)
mdm<-distancematrix(plainmatrix)
res<-nonbimatch(mdm)




