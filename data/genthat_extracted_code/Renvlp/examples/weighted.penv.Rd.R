library(Renvlp)


### Name: weighted.penv
### Title: Weighted partial envelope estimator
### Aliases: weighted.penv

### ** Examples

data(fiberpaper)
X1 <- fiberpaper[, 7]
X2 <- fiberpaper[, 5:6]
Y <- fiberpaper[, 1:4]
m <- weighted.penv(X1, X2, Y)
m$w
m$beta1

m2 <- penv(X1, X2, Y, 2)
m2$beta1


## Not run: m3 <- weighted.penv(X1, X2, Y, bstrpNum = 100, boot.resi = "full")
## Not run: m3$w
## Not run: m3$bic_select
## Not run: m3$bootse

## Not run: boot.penv(X1, X2, Y, 2, 100)




