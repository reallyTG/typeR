library(rgr)


### Name: gx.ilr
### Title: Isometric Log-Ratio (ilr) transformation
### Aliases: gx.ilr
### Keywords: multivariate manip

### ** Examples

## Make test data sind available
data(sind.mat2open)

## Undertake ilr transform
temp <- gx.ilr(sind.mat2open, 5)
temp

## Clean-up
rm(temp)



