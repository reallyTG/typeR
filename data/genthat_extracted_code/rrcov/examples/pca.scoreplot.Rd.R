library(rrcov)


### Name: pca.scoreplot
### Title: Score plot for Principal Components (objects of class 'Pca')
### Aliases: pca.scoreplot
### Keywords: robust multivariate

### ** Examples

require(graphics)

## PCA of the Hawkins Bradu Kass's Artificial Data
##  using all 4 variables
data(hbk)
pca <- PcaHubert(hbk)
pca
pca.scoreplot(pca)



