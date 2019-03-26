library(RandomFields)


### Name: RFloglikelihood
### Title: Likelihood and estimation of linear models
### Aliases: RFloglikelihood RFlikelihood
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again


requireNamespace("mvtnorm")

pts <- 4
repet <- 3
model <- RMexp()
x <- runif(n=pts, min=-1, max=1)
y <- runif(n=pts, min=-1, max=1)
dta <- as.matrix(RFsimulate(model, x=x, y=y, n=repet, spC = FALSE))
print(cbind(x, y, dta))
print(system.time(likeli <- RFlikelihood(model, x, y, data=dta)))
str(likeli, digits=8)

L <- 0
C <- RFcovmatrix(model, x, y)
for (i in 1:ncol(dta)) {
  print(system.time(dn <- mvtnorm::dmvnorm(dta[,i], mean=rep(0, nrow(dta)),
sigma=C, log=TRUE)))
  L <- L + dn
}
print(L)
stopifnot(all.equal(likeli$log, L))





pts <- 4
repet <- 1
trend <- 2 * sin(R.p(new="isotropic")) + 3
#trend <- RMtrend(mean=0)
model <- 2 * RMexp() + trend
x <- seq(0, pi, len=pts)
dta <- as.matrix(RFsimulate(model, x=x, n=repet, spC = FALSE))
print(cbind(x, dta))

print(system.time(likeli <- RFlikelihood(model, x, data=dta)))
str(likeli, digits=8)

L <- 0
tr <- RFfctn(trend, x=x, spC = FALSE)
C <- RFcovmatrix(model, x)
for (i in 1:ncol(dta)) {
  print(system.time(dn <- mvtnorm::dmvnorm(dta[,i], mean=tr, sigma=C,log=TRUE)))
  L <- L + dn
}
print(L)

stopifnot(all.equal(likeli$log, L))






pts <- c(3, 4)
repet <- c(2, 3)
trend <- 2 * sin(R.p(new="isotropic")) + 3
model <- 2 * RMexp() + trend
x <- y <- dta <- list()
for (i in 1:length(pts)) {
  x[[i]] <- list(x = runif(n=pts[i], min=-1, max=1),
                 y = runif(n=pts[i], min=-1, max=1))
  dta[[i]] <- as.matrix(RFsimulate(model, x=x[[i]]$x, y=x[[i]]$y,
                                    n=repet[i], spC = FALSE))
}

print(system.time(likeli <- RFlikelihood(model, x, data=dta)))
str(likeli, digits=8)

L <- 0
for (p in 1:length(pts)) {
  tr <- RFfctn(trend, x=x[[p]]$x, y=x[[p]]$y,spC = FALSE)
  C <- RFcovmatrix(model, x=x[[p]]$x, y=x[[p]]$y)
  for (i in 1:ncol(dta[[p]])) {
    print(system.time(dn <- mvtnorm::dmvnorm(dta[[p]][,i], mean=tr, sigma=C,
                                    log=TRUE)))
    L <- L + dn
  }
}
print(L)
stopifnot(all.equal(likeli$log, L))

## Don't show: 
FinalizeExample()
## End(Don't show)


