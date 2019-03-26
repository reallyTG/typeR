library(propagate)


### Name: cor2cov
### Title: Converting a correlation matrix into a covariance matrix
### Aliases: cor2cov
### Keywords: matrix multivariate algebra

### ** Examples

## Example in Annex H.2 from the GUM 2008 manual
## (see 'References'), simultaneous resistance
## and reactance measurement.
data(H.2)
attach(H.2)

## Original covariance matrix.
COV <- cov(H.2)
## extract variances
VAR <- diag(COV)

## cor2cov covariance matrix.
COV2 <- cor2cov(cor(H.2), VAR) 

## Equal to original covariance matrix.
all.equal(COV2, COV)



