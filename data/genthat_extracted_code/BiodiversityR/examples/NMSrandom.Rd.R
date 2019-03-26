library(BiodiversityR)


### Name: NMSrandom
### Title: Calculate the NMS Result with the Smallest Stress from Various
###   Random Starts
### Aliases: NMSrandom
### Keywords: multivariate

### ** Examples

library(vegan)
library(MASS)
data(dune)
distmatrix <- vegdist(dune)
Ordination.model1 <- NMSrandom(distmatrix,perm=100,k=2)
Ordination.model1 <- add.spec.scores(Ordination.model1,dune, 
    method='wa.scores')
Ordination.model1



