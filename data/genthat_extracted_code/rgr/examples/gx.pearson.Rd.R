library(rgr)


### Name: gx.pearson
### Title: Display Pearson Correlation Coefficients and their Significances
### Aliases: gx.pearson
### Keywords: multivariate htest

### ** Examples

## Make test data available
data(sind.mat2open)

## Compute Pearson correlation coefficients
gx.pearson(sind.mat2open)

## Compute Pearson correlation coefficients following
## a logarithmic transformation
gx.pearson(sind.mat2open, log = TRUE)

## Compute Pearson correlation coefficients following
## a centred log-ratio transformation
gx.pearson(sind.mat2open, ifclr = TRUE)



