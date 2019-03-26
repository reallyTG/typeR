library(rgr)


### Name: gx.mva
### Title: Function to undertake an Exploratory Multivariate Data Analysis
### Aliases: gx.mva
### Keywords: multivariate

### ** Examples

## Make test data available
data(sind.mat2open)

## Generate gx.mva object, for demonstration purposes only
## These are compositional data - gx.mva.closed should be used
sind.save <- gx.mva(sind.mat2open)
gx.rqpca.screeplot(sind.save)
gx.rqpca.loadplot(sind.save)
gx.rqpca.plot(sind.save)
## Display saved object with alternate main titles
gx.rqpca.loadplot(sind.save,
main = "Howarth & Sinding-Larsen\nStream Sediments, clr Transformed Data",
cex.main = 0.8)
gx.rqpca.plot(sind.save,
main = "Howarth & Sinding-Larsen\nStream Sediments, clr Transformed Data",
cex.main = 0.8)

## Display Mahalanobis distances in a Chi-square plot
gx.md.plot(sind.save)
## Display saved object with alternate main titles
gx.md.plot(sind.save,
main = "Howarth & Sinding-Larsen\nStream Sediments, ilr Transformed Data",
cex.main = 0.8)

## Clean-up
rm(sind.save)



