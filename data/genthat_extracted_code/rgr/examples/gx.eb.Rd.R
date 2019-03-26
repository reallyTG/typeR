library(rgr)


### Name: gx.eb
### Title: Computation of Empirical Balances
### Aliases: gx.eb
### Keywords: multivariate

### ** Examples

## Make test data available
data(sind.mat2open)

## Compute and display empirical balances for columns 1, 5 & 4 
## of the data vs. columns 2 & 3
temp <- gx.eb(3, 2, sind.mat2open, 1, 5, 4, 2, 3)
shape(temp, "Zn.Cu.Cd/Fe.Mn balance")

## Clean-up
rm(sind.mat2open)
rm(temp)



