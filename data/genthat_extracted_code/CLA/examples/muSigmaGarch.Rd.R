library(CLA)


### Name: muSigmaGarch
### Title: Compute (mu, Sigma) for a Set of Assets via GARCH fit
### Aliases: muSigmaGarch
### Keywords: multivariate

### ** Examples

if(requireNamespace("FRAPO")) {
  data(NASDAQ, package = "FRAPO")
  set.seed(17)
  ## 12 randomly picked stocks from NASDAQ data
  iS <- sample(ncol(NASDAQ), 12)
  X. <- NASDAQ[, iS]
  muSig <- muSigmaGarch(X.)
  stopifnot(identical(names(muSig$mu), names(NASDAQ)[iS]),
            identical(dim(muSig$covar), c(12L,12L)),
     all.equal(unname(muSig$mu),
               c(  7.97, -4.05, -14,     21.5, -5.36, -15.3,
                 -15.9,  11.8,   -1.64, -14,    3.13, 121) / 10000,
               tol = 0.0015))
}



