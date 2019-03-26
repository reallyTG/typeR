library(tsdecomp)


### Name: ARMAacov
### Title: Compute Theoretical Autocovariances of an ARMA Model
### Aliases: ARMAacov
### Keywords: ts

### ** Examples

# Autocovariances of an ARMA(2,1)
# method 1: using ARMAacov()
a1 <- ARMAacov(ar=c(0.8,-0.6), ma=0.4, lag.max=10)

# method 2: upon the coefficients of the infinite MA representation
psi <- c(1, ARMAtoMA(ar=c(0.8,-0.6), ma=0.4, lag.max=50))
a2 <- c(sum(psi^2), rep(0, length(a1)-1))
for (i in seq_along(a2[-1]))
  a2[i+1] <- sum(psi[seq_len(length(psi)-i)] * psi[-seq_len(i)])

# for a high enough number of 'psi' coefficients
# both methods are equivalent
all.equal(a1, a2, check.names=FALSE)
#[1] TRUE



