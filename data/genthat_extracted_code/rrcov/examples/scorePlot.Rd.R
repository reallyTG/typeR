library(rrcov)


### Name: scorePlot-methods
### Title: Score plot for Principal Components (objects of class 'Pca')
### Aliases: scorePlot scorePlot-methods scorePlot,ANY-method
###   scorePlot,Pca-method
### Keywords: multivariate hplot

### ** Examples

require(graphics)

## PCA of the Hawkins Bradu Kass's Artificial Data
##  using all 4 variables
data(hbk)
pca <- PcaHubert(hbk)
pca

scorePlot(pca)



