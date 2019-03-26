library(FSA)


### Name: poiCI
### Title: Confidence interval for Poisson counts.
### Aliases: poiCI
### Keywords: htest

### ** Examples

## Demonstrates using all types at once
poiCI(12)

## Selecting types
poiCI(12,type="daly")
poiCI(12,type="byar")
poiCI(12,type="asymptotic")
poiCI(12,type="asymptotic",verbose=TRUE)
poiCI(12,type=c("exact","daly"))
poiCI(12,type=c("exact","daly"),verbose=TRUE)

## Demonstrates use with multiple inputs
poiCI(c(7,10),type="exact")
poiCI(c(7,10),type="exact",verbose=TRUE)




