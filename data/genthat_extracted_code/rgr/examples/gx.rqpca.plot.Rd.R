library(rgr)


### Name: gx.rqpca.plot
### Title: Function to Plot Principal Component Analysis Loadings and
###   Scores
### Aliases: gx.rqpca.plot
### Keywords: hplot

### ** Examples

## Make test data available
data(sind)
data(sind.mat2open)
attach(sind)

## Save PCA results and display biplots
sind.save <- gx.mva.closed(sind.mat2open)
gx.rqpca.plot(sind.save)
gx.rqpca.plot(sind.save,
main = "Howarth & Sinding Larsen Stream Sediments\nclr transform",
pch = 4, rcol =2, qcol = 4)
gx.rqpca.plot(sind.save, rplot = TRUE, qplot = FALSE, rowids = NULL)
gx.rqpca.plot(sind.save, rplot = FALSE, qplot = TRUE, rowids = NULL)
gx.rqpca.plot(sind.save, rplot = FALSE, qplot = TRUE, rowids = TRUE)
gx.rqpca.plot(sind.save, rplot = TRUE, qplot = TRUE, rowids = FALSE,
rcol = 2, qcol = 4)

##
## Alternately
xyplot.tags(sind.save$rqscore[, 1],sind.save$rqscore[, 2], ID, cex = 0.9)

## Clean-up and detach test data
rm(sind.save)
detach(sind)



