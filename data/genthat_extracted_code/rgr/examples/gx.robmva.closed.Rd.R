library(rgr)


### Name: gx.robmva.closed
### Title: Function to undertake a Robust Closed Data Multivariate EDA
### Aliases: gx.robmva.closed
### Keywords: multivariate robust

### ** Examples

## Make test data available
data(sind.mat2open)

## Generate gx.robmva.closed object
sind.save <- gx.robmva.closed(sind.mat2open)

## Display Mahalanobis distances
gx.md.plot(sind.save)

## Display default PCA results
gx.rqpca.screeplot(sind.save)
gx.rqpca.loadplot(sind.save)

## Display appropriately annotated results
gx.md.plot(sind.save,
main = "Howarth & Sinding-Larsen\nStream Sediments, Opened Data",
cex.main=0.8)
gx.rqpca.screeplot(sind.save,
main = "Howarth & Sinding-Larsen Stream Sediments\nOpened Data")
gx.rqpca.plot(sind.save,
main = "Howarth & Sinding-Larsen Stream Sediments\nOpened Data")
gx.rqpca.plot(sind.save, rowids = TRUE, 
main = "Howarth & Sinding-Larsen Stream Sediments\nOpened Data")
sind.save$pvcontrib
gx.rqpca.plot(sind.save, v1 = 3, v2 =4, rowids = TRUE,
main = "Howarth & Sinding-Larsen Stream Sediments\nOpened Data")

## Display Kaiser Varimax rotated (nrot = 4) results
sind.save.rot4 <- gx.rotate(sind.save, 4)
gx.rqpca.plot(sind.save.rot4,
main = "Howarth & Sinding-Larsen Stream Sediments\nOpened Data")
gx.rqpca.plot(sind.save.rot4, rowids = TRUE, 
main = "Howarth & Sinding-Larsen Stream Sediments\nOpened Data")
gx.rqpca.plot(sind.save.rot4, v1 = 3, v2 =4, rowids = TRUE,
main = "Howarth & Sinding-Larsen Stream Sediments\nOpened Data")

## Clean-up
rm(sind.save)
rm(sind.save.rot4)



