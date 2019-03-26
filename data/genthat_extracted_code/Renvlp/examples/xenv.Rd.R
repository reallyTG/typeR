library(Renvlp)


### Name: xenv
### Title: Fit the envelope model in the predictor space
### Aliases: xenv

### ** Examples

## Fit the envelope in the predictor space	
data(wheatprotein)
X <- wheatprotein[, 1:6]
Y <- wheatprotein[, 7]
u <- u.xenv(X, Y)
u

m <- xenv(X, Y, 4)
m
m$beta


## Not run: m1 <- pls::simpls.fit(X, Y, 4)
## Not run: m1$coefficients



