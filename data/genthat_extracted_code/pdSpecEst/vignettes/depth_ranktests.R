## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", fig.align = "center", out.width = "600px")
a4width<- 8.3
a4height<- 11.7

## ------------------------------------------------------------------------
## Pointwise random sample
library(pdSpecEst); set.seed(100)
X1 <- replicate(50, Expm(diag(2), H.coeff(0.5 * rnorm(4), inverse = T))); str(X1)

## Curve random sample
X2 <- replicate(50, sapply(1:5, function(i) Expm(i * diag(2), H.coeff(0.5 *
                           rnorm(4), inverse = T) / i), simplify = "array")); str(X2)

## ------------------------------------------------------------------------
## Pointwise geodesic distance, zonoid and spatial depth
point.depth <- function(method) pdDepth(y = diag(2), X = X1, method = method)
point.depth("gdd"); point.depth("zonoid"); point.depth("spatial")

## Integrated geodesic distance, zonoid and spatial depth
int.depth <- function(method){ pdDepth(y = sapply(1:5, function(i) i * diag(2),
                                    simplify = "array"), X = X2, method = method) }
int.depth("gdd"); int.depth("zonoid"); int.depth("spatial")


## ------------------------------------------------------------------------
(dd1 <- pdDepth(X = X1, method = "gdd")) ## pointwise geodesic distance depth

(dd2 <- pdDepth(X = X2, method = "gdd")) ## integrated geodesic distance depth

## ------------------------------------------------------------------------
(dd1.ranks <- rank(1 - dd1)) ## pointwise depth ranks

(dd2.ranks <- rank(1 - dd2)) ## integrated depth ranks

## Explore sample X1
head(order(dd1.ranks)) ## most central observations
rev(tail(order(dd1.ranks))) ## most outlying observations
X1[ , , which(dd1.ranks == 1)] ## most central HPD matrix
X1[ , , which(dd1.ranks == 50)] ## most outlying HPD matrix

## ------------------------------------------------------------------------
(med.X1 <- pdMedian(X1)) ## intrinsic sample median


pdDepth(y = med.X1, X = X1, method = "gdd") ## maximum out-of-sample depth

max(dd1) ## maximum in-sample depth

## ------------------------------------------------------------------------
## Generate data (null true)
data1 <- array(c(X1, replicate(50, Expm(diag(2), H.coeff(0.5 * rnorm(4), inverse = T)))), dim = c(2, 2, 100)) ## pointwise HPD sample
data2 <- array(c(X2, replicate(50, sapply(1:5, function(i) Expm(i * diag(2), H.coeff(0.5 * rnorm(4), inverse = T) / i), simplify = "array"))), dim = c(2, 2, 5, 100)) ## HPD curve sample

## Generate data (null false)
data1a <- array(c(X1, replicate(50, Expm(diag(2), H.coeff(rnorm(4), inverse = T)))), dim = c(2, 2, 100)) ## pointwise HPD scale change
data2a <- array(c(X2, replicate(50, sapply(1:5, function(i) Expm(i * diag(2), H.coeff(rnorm(4), inverse = T) / i), simplify = "arra"))), dim = c(2, 2, 5, 100)) ## HPD curve scale change

## Rank-sum test
pdRankTests(data1, sample_sizes = c(50, 50), "rank.sum")[1:4] ## null true (pointwise)

pdRankTests(data2, sample_sizes = c(50, 50), "rank.sum")[2] ## null true (curve)

pdRankTests(data1a, sample_sizes = c(50, 50), "rank.sum")[2] ## null false (pointwise)

pdRankTests(data2a, sample_sizes = c(50, 50), "rank.sum")[2] ## null false (curve)

## Kruskal-Wallis test
pdRankTests(data1, sample_sizes = c(50, 25, 25), "krusk.wall")[1:4] ## null true (pointwise)

pdRankTests(data2, sample_sizes = c(50, 25, 25), "krusk.wall")[2] ## null true (curve)

pdRankTests(data1a, sample_sizes = c(50, 25, 25), "krusk.wall")[2] ## null false (pointwise)

pdRankTests(data2a, sample_sizes = c(50, 25, 25), "krusk.wall")[2] ## null false (curve)

## ------------------------------------------------------------------------
## Trial-specific means
mu <- replicate(50, Expm(diag(2), H.coeff(0.1 * rnorm(4), inverse = T)))

## Generate paired samples X,Y
make_sample <- function(null) sapply(1:50, function(i) Expm(mu[, , i], pdSpecEst:::T_coeff_inv(ifelse(null, 1, 0.5) * rexp(4) - 1, mu[, , i])), simplify = "array")

X3 <- make_sample(null = T) ## refernce sample 
Y3 <- make_sample(null = T) ## null true
Y3a <- make_sample(null = F) ## null false (scale change)

## Signed-rank test
pdRankTests(array(c(X3, Y3), dim = c(2, 2, 100)), test = "signed.rank")[1:4] ## null true

pdRankTests(array(c(X3, Y3a), dim = c(2, 2, 100)), test = "signed.rank")[2] ## null false


## ------------------------------------------------------------------------
## Signed-rank test for equivalence of spectra
## vARMA(1,1) process: Example 11.4.1 in (Brockwell and Davis, 1991)
Phi <- array(c(0.7, 0, 0, 0.6, rep(0, 4)), dim = c(2, 2, 2))
Theta <- array(c(0.5, -0.7, 0.6, 0.8, rep(0, 4)), dim = c(2, 2, 2))
Sigma <- matrix(c(1, 0.71, 0.71, 2), nrow = 2)
pgram <- function(Sigma) pdPgram(rARMA(2^10, 2, Phi, Theta, Sigma)$X)$P ## HPD periodogram

## Null is true
pdRankTests(array(c(pgram(Sigma), pgram(Sigma)), dim = c(2, 2, 2^10)), test = "signed.rank")[2]

## Null is false
pdRankTests(array(c(pgram(Sigma), pgram(0.9 * Sigma)), dim = c(2, 2, 2^10)), test = "signed.rank")[2]

## ------------------------------------------------------------------------
## Null is true
data3 <- replicate(200, Expm(diag(2), H.coeff(rnorm(4), inverse = T))) ## iid HPd sample
data4 <- replicate(100, sapply(1:5, function(i) Expm(i * diag(2), H.coeff(rnorm(4), inverse = T) / i), simplify = "array")) ## iid HPD curve

## Null is false
data3a <- sapply(1:200, function(j) Expm(diag(2), H.coeff(((200 - j) / 200 + j * 2 / 200) * rnorm(4), inverse = T)), simplify = "array") ## pointwise trend in scale
data4a <- sapply(1:100, function(j) sapply(1:5, function(i) Expm(i * diag(2), H.coeff(((100 - j) / 100 + j * 2 / 100) * rnorm(4), inverse = T) / i), simplify = "array"), simplify = "array") ## curve trend in scale

## Bartels-von Neumann test
pdRankTests(data3, test = "bartels")[1:4] ## null true (pointwise)

pdRankTests(data4, test = "bartels")[2] ## null true (curve)

pdRankTests(data3a, test = "bartels")[2] ## null false (pointwise)

pdRankTests(data4a, test = "bartels")[2] ## null false (curve)

