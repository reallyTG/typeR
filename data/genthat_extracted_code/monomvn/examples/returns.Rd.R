library(monomvn)


### Name: returns
### Title: Financial Returns data from NYSE and AMEX
### Aliases: returns returns.test market market.test
### Keywords: datasets

### ** Examples

data(returns)

## investigate the monotone missingness pattern
returns.na <- is.na(returns)
image(1:ncol(returns), 1:nrow(returns), t(returns.na))

## for a portfolio balancing exercise, see
## the example in the bmonomvn help file



