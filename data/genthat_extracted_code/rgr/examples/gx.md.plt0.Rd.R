library(rgr)


### Name: gx.md.plt0
### Title: Function to Display Chi-square plots of Mahalanobis Distances
### Aliases: gx.md.plt0
### Keywords: hplot

### ** Examples

## Make test data available
data(sind.mat2open)

## Generate and display sets of Mahalanobis distances
gx.md.gait(ilr(sind.mat2open))
gx.md.gait(ilr(sind.mat2open), mcdstart = TRUE, ifadd = NULL)
gx.md.gait(ilr(sind.mat2open), mcdstart = TRUE, mvtstart = TRUE, trim = 3,
ifadd = 0.9)



