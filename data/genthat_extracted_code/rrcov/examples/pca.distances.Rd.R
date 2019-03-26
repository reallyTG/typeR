library(rrcov)


### Name: pca.distances
### Title: Compute score and orthogonal distances for Principal Components
###   (objects of class 'Pca')
### Aliases: pca.distances
### Keywords: robust multivariate

### ** Examples


## PCA of the Hawkins Bradu Kass's Artificial Data
##  using all 4 variables
data(hbk)
pca <- PcaHubert(hbk)
pca.distances(pca, hbk, rankMM(hbk))



