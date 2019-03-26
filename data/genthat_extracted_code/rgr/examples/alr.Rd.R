library(rgr)


### Name: alr
### Title: Additive Log-Ratio (alr) transformation
### Aliases: alr
### Keywords: multivariate manip

### ** Examples

## Make test data available
data(sind)
sind.mat <- as.matrix(sind[, -c(1:3)])

## Undertake alr transform, use Pb [j = 6] as the divisor,
## note necessity of converting percent Fe to mg/kg
sind.mat[, 2] <- sind.mat[, 2] * 10000
temp <- alr(sind.mat, 6)
temp

## Clean-up
rm(sind.mat)
rm(temp)



