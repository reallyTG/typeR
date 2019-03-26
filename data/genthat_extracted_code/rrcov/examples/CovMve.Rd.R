library(rrcov)


### Name: CovMve
### Title: Robust Location and Scatter Estimation via MVE
### Aliases: CovMve
### Keywords: robust multivariate

### ** Examples

data(hbk)
hbk.x <- data.matrix(hbk[, 1:3])
CovMve(hbk.x)

## the following three statements are equivalent
c1 <- CovMve(hbk.x, alpha = 0.75)
c2 <- CovMve(hbk.x, control = CovControlMve(alpha = 0.75))
## direct specification overrides control one:
c3 <- CovMve(hbk.x, alpha = 0.75,
             control = CovControlMve(alpha=0.95))
c1



