library(rgr)


### Name: expit
### Title: Inverse-logit transformation(s)
### Aliases: expit
### Keywords: univariate manip

### ** Examples

## Generate test data
z <- c(1.6, 0, -2.3)

## Undertake and display inverse-logit transformation(s)
p <- expit(z)
p

## Clean-up
rm(z)
rm(p)



