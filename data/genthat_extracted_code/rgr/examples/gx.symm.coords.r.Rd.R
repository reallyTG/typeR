library(rgr)


### Name: gx.symm.coords.r
### Title: Displays a Matrix of Correlation Coefficients based on Symmetric
###   Balances
### Aliases: gx.symm.coords.r
### Keywords: multivariate

### ** Examples

## Make test data available
data(nockolds)

## Compute and display correlation coefficients for the nockolds data
gx.symm.coords.r(nockolds)

## Save the matrix for further use
save <- gx.symm.coords.r(nockolds)

## Compute and display correlation coefficients for the nockolds data
## based on pearson product moment correlation coefficients with a
## logarithmic transform for the non-symmetric balance coefficients
gx.symm.coords.r(nockolds, method = "pearson", log = TRUE)

## Clean-up
rm(nockolds)
rm(save)



