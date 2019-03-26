library(psd)


### Name: ctap_simple_rcpp
### Title: Taper constraints using simple derivatives
### Aliases: ctap_simple ctap_simple.default ctap_simple.tapers
###   ctap_simple_rcpp ctap_simple_rcpp.default ctap_simple_rcpp.tapers

### ** Examples

# generate some random taper series and constrain them based on slopes
set.seed(1237)
n <- 11
x <- seq_len(n)
xn <- round(runif(n,1,n))

xnf <- ctap_simple_rcpp(xn, 0) # flattens out
xnc <- ctap_simple_rcpp(xn, 1) # no change, already only slopes = 1
try(all.equal(xnc, xn))
xnc2 <- ctap_simple_rcpp(xn, 2) # slopes = 2 only

plot(xn, type='b', pch=16, ylim=c(0,12))
grid()
abline(a=0,b=1, col='red', lty=3); abline(a=0,b=2, col='blue', lty=3)
lines(xnf, type='b', col='green')
lines(xnc, type='b', col='red')
lines(xnc2, type='b', col='blue')
lines(0.2+as.vector(psd::ctap_simple(psd::as.tapers(xn))), type='b', pch=".", col='salmon')

# compare simple and rcpp implementations
kcr <- ctap_simple_rcpp(xn, 2)
kcs <- ctap_simple(xn, 2)
rbind(kcs, kcr)
try(all.equal(kcr, kcs))

# more examples:



