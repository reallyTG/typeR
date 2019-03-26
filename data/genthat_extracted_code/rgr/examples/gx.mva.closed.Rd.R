library(rgr)


### Name: gx.mva.closed
### Title: Function to undertake an Exploratory Multivariate Data Analysis
###   on Compositional, geochemical data
### Aliases: gx.mva.closed
### Keywords: multivariate

### ** Examples

## Make test data available
data(sind.mat2open)

## Generate gx.mva object after an clr transform for a PCA
sind.closed <- gx.mva.closed(sind.mat2open)
gx.rqpca.screeplot(sind.closed)
gx.rqpca.plot(sind.closed)
gx.rqpca.loadplot(sind.closed)
## Display saved object with alternate main titles
gx.rqpca.loadplot(sind.closed,
main = "Howarth & Sinding-Larsen\nStream Sediments, clr Transformed Data",
cex.main = 0.8)
gx.rqpca.plot(sind.closed,
main = "Howarth & Sinding-Larsen\nStream Sediments, clr Transformed Data",
cex.main = 0.8)

## Display Mahalanobis distances with alternate main title
gx.md.plot(sind.closed,
main = "Howarth & Sinding-Larsen\nStream Sediments, ilr Transformed Data",
cex.main = 0.8)

## Clean-up
rm(sind.closed)



