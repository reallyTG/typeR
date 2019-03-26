library(rgr)


### Name: gx.rotate
### Title: Function to Perform a Kaiser Varimax Rotaion
### Aliases: gx.rotate
### Keywords: multivariate

### ** Examples

## Make test data available
data(sind.mat2open)

## Save PCA results and display biplots before and after Varimax rotation
sind.save <- gx.mva(clr(sind.mat2open))
gx.rqpca.plot(sind.save)
gx.rqpca.plot(sind.save,
main = "Howarth & Sinding Larsen Stream Sediments\nclr transform",
pch = 4, cex.main = 0.9)
sind.save.rot2 <- gx.rotate(sind.save)
gx.rqpca.plot(sind.save.rot2,
main = "Howarth & Sinding Larsen Stream Sediments\nclr transform",
pch = 4, cex.main = 0.9)

## Clean-up
rm(sind.save)
rm(sind.save.rot2)



