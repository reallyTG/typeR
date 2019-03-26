library(Rmpfr)


### Name: sumBinomMpfr
### Title: (Alternating) Binomial Sums via Rmpfr
### Aliases: sumBinomMpfr
### Keywords: arith

### ** Examples

## "naive" R implementation:
sumBinom <- function(n, f, n0=0, ...) {
  k <- n0:n
  sum( choose(n, k) * (-1)^(n-k) * f(k, ...))
}

## compute  sumBinomMpfr(.) for a whole set of 'n' values:
sumBin.all <- function(n, f, n0=0, precBits = 256, ...)
{
  N <- length(n)
  precBits <- rep(precBits, length = N)
  ll <- lapply(seq_len(N), function(i)
           sumBinomMpfr(n[i], f, n0=n0, precBits=precBits[i], ...))
  sapply(ll, as, "double")
}
sumBin.all.R <- function(n, f, n0=0, ...)
   sapply(n, sumBinom, f=f, n0=n0, ...)

n.set <- 5:80
system.time(res.R   <- sumBin.all.R(n.set, f = sqrt)) ## instantaneous..
system.time(resMpfr <- sumBin.all  (n.set, f = sqrt)) ## ~ 0.6 seconds
## Don't show: 
stopifnot(
    all.equal(resMpfr[1:10], res.R[1:10], tolerance=1e-12),
    all.equal(resMpfr[1:20], res.R[1:20], tolerance=1e-9 ),
    all.equal(resMpfr[1:30], res.R[1:30], tolerance=1e-6 ))
## End(Don't show)
matplot(n.set, cbind(res.R, resMpfr), type = "l", lty=1,
        ylim = extendrange(resMpfr, f = 0.25), xlab = "n",
        main = "sumBinomMpfr(n, f = sqrt)  vs.  R double precision")
legend("topleft", leg=c("double prec.", "mpfr"), lty=1, col=1:2, bty = "n")



