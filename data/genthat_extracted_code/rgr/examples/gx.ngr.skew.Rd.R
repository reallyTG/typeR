library(rgr)


### Name: gx.ngr.skew
### Title: Estimate the Skewness of a Data Vector
### Aliases: gx.ngr.skew
### Keywords: univar

### ** Examples

## Make test data available
data(sind)
attach(sind)

## Estimate and display the skewness of the Zn data 
skew <- gx.ngr.skew(Zn)
skew

## Alternately
skew <- gx.ngr.skew(rnorm(0,1,1000))
skew

## Detach test data
detach(sind)



