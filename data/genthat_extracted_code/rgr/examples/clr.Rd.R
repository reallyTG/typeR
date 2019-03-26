library(rgr)


### Name: clr
### Title: Centred Log-Ratio (clr) transformation
### Aliases: clr
### Keywords: multivariate manip

### ** Examples

## Make test data available
data(sind)
sind.mat <- as.matrix(sind[, -c(1:3)])

## Undertake clr transform, note necessity
## of converting percent Fe to mg/kg
sind.mat[, 2] <- sind.mat[, 2] * 10000
temp <- clr(sind.mat)
temp

## Clean-up and detach test data
rm(sind.mat)
rm(temp)



