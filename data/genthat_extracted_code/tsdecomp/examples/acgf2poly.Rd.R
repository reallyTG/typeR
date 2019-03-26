library(tsdecomp)


### Name: acgf2poly
### Title: Change of Variable in the AutoCovariance Generating Function
### Aliases: acgf2poly poly2acgf print.tsdecMAroots
### Keywords: ts

### ** Examples

# the matrix 'm' performs the mapping from the original 
# to the transformed coefficients
n <- 30
m <- diag(1, n, n)
n2 <- n - 2
j <- -1
tmp <- seq.int(2, n-1)
for (i in seq.int(3, n-2, 2))
{
  id <- cbind(seq_len(n2),seq.int(i,n))
  m[id] <- j * tmp
  n2 <- n2 - 2
  j <- -1 * j
  tmp <- cumsum(tmp[seq_len(n2)])
}
if (2*floor(n/2) == n) {  # if (n %% 2 == 0)
  m[cbind(seq_len(n2),seq.int(n-1,n))] <- j * tmp 
} else 
  m[1,n] <- j * tmp
m[1:10,1:10]

# equivalence of the original and transformed coefficients,
# example with an ARMA(2,1) model
#
# method 1: compute the spectral density upon the 
# the theoretical autocovariances ('gamma') of the ARMA model
gamma <- ARMAacov(ar=c(0.8,-0.6), ma=0.4, lag.max=n-1)
w <- seq(0, pi, len=length(gamma))
spec1 <- rep(gamma[1], length(w))
for (i in seq_along(w))
{
  z <- 2*cos(w[i] * seq_len(length(gamma)-1))
  spec1[i] <- spec1[i] + sum(gamma[seq.int(2, n)] * z)
}
spec1 <- spec1/(2*pi)
#plot(w, spec1)

# method 2: compute the spectral density upon the 
# transformed coefficients
newcoefs <- m 
spec2 <- rep(newcoefs[1], length(w))
for (i in seq_along(w))
{
  x <- (2*cos(w[i]))^seq_len(n-1)
  spec2[i] <- spec2[i] + sum(newcoefs[seq.int(2, n)] * x)
}
spec2 <- spec2/(2*pi)

# both representations are equivalent
all.equal(spec1, spec2, check.names=FALSE)
#[1] TRUE

# the original coefficients (the autocovariances) 
# can be recovered premultiplying by the inverse of the 
# transformation matrix 'm'
all.equal(c(solve(m) %*% newcoefs), gamma, check.names=FALSE)
#[1] TRUE



