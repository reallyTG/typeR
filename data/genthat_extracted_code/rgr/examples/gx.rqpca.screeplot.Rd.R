library(rgr)


### Name: gx.rqpca.screeplot
### Title: Display a Scree Plot
### Aliases: gx.rqpca.screeplot
### Keywords: hplot

### ** Examples

## Make test data available
data(sind.mat2open)

## Save PCA results and display scree plot
sind.save <- gx.mva(ilr(sind.mat2open))
gx.rqpca.screeplot(sind.save)
gx.rqpca.screeplot(sind.save,
main = "Howarth & Sinding Larsen Stream Sediments\nilr transform",
pch = 4, col = 2, cex.main = 0.9)

## Clean-up
rm(sind.save)



