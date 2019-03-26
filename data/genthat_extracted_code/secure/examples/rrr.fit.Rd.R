library(secure)


### Name: rrr.fit
### Title: Fit reduced rank regression
### Aliases: rrr.fit

### ** Examples

#require(secure)
Y <- matrix(rnorm(400), 100, 4)
X <- matrix(rnorm(800), 100, 8)
rrr.fit <- rrr.fit(Y, X, nrank = 3)



