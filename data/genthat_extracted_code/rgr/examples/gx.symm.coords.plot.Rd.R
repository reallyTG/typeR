library(rgr)


### Name: gx.symm.coords.plot
### Title: Display a X-Y Plot, Scatterplot, of Symmetric Balances
### Aliases: gx.symm.coords.plot
### Keywords: multivariate

### ** Examples

## Make test data available
data(nockolds)

## Display symmetric balances scatterplot for variable 1, Si, and 2, Al, for the nockolds data
gx.symm.coords.plot(nockolds, 1, 2)

## Display the example from Garrett et al. (2017)
gx.symm.coords.plot(nockolds, 1, 2, example = "explore")

## Clean-up
rm(nockolds)



