library(rgr)


### Name: logit
### Title: Logit transformation
### Aliases: logit
### Keywords: univariate manip

### ** Examples

## Generate test data
p <- c(0.1, 0.5, 0.9)

## Undertake and display logit transformations
z <- logit(p)
z

## Clean-up
rm(p)
rm(z)



