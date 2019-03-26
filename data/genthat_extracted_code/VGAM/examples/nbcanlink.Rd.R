library(VGAM)


### Name: nbcanlink
### Title: Negative Binomial Canonical Link Function
### Aliases: nbcanlink
### Keywords: math models regression

### ** Examples

nbcanlink("mu", short = FALSE)

mymu <- 1:10  # Test some basic operations:
kmatrix <- cbind(runif(length(mymu)))
eta1 <- nbcanlink(mymu, size = kmatrix)
ans2 <- nbcanlink(eta1, size = kmatrix, inverse = TRUE)
max(abs(ans2 - mymu))  # Should be 0

## Not run: 
##D  mymu <- seq(0.5, 10, length = 101)
##D kmatrix <- matrix(10, length(mymu), 1)
##D plot(nbcanlink(mymu, size = kmatrix) ~ mymu, las = 1,
##D      type = "l", col = "blue", xlab = expression({mu}))
## End(Not run)

# Estimate the parameters from some simulated data
ndata <- data.frame(x2 = runif(nn <- 100))
ndata <- transform(ndata, eta1 = -1 - 1 * x2,  # eta1 < 0
                          size1 = exp(1),
                          size2 = exp(2))
ndata <- transform(ndata,
            mu1 = nbcanlink(eta1, size = size1, inverse = TRUE),
            mu2 = nbcanlink(eta1, size = size2, inverse = TRUE))
ndata <- transform(ndata, y1 = rnbinom(nn, mu = mu1, size = size1),
                          y2 = rnbinom(nn, mu = mu2, size = size2))
summary(ndata)

nbcfit <- vglm(cbind(y1, y2) ~ x2,
            negbinomial(lmu = "nbcanlink", imethod = 1),  # Try this
#            negbinomial(lmu = "nbcanlink", imethod = 2),  # Try this
            data = ndata, trace = TRUE)
coef(nbcfit, matrix = TRUE)
summary(nbcfit)



