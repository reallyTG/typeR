library(rgr)


### Name: ilr
### Title: Isometric Log-Ratio (ilr) transformation
### Aliases: ilr
### Keywords: multivariate manip

### ** Examples

## Make test data sind available
data(sind.mat2open)

## Undertake ilr transform
temp <- ilr(sind.mat2open)
temp

## Clean-up
rm(temp)



