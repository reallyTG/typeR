library(gpDDE)


### Name: Profile.LS.DDE
### Title: Profile Estimation Functions for DDE
### Aliases: Profile.LS.DDE

### ** Examples

yout <- DSIRdata
times <- seq(-0.5, 30, by = 0.1)
yout0 <- yout[times >= 0, ]
yout.d <- yout[times >= 5, ]
colnames(yout.d) <-  c("S","I")
times0 <- times[times>=0]
times.d <- times[times>=5]
norder = 3
nbasis.d = length(times.d) + norder - 2
nbasis0 <- length(times0) + norder - 2
basis0 <- create.bspline.basis(range=range(times0),
    nbasis=nbasis0, norder=norder, breaks=times0)
basis.d <- create.bspline.basis(range=range(times.d),
    nbasis=nbasis.d, norder=norder, breaks=times.d)
fdnames=list(NULL,c('S', 'I'),NULL)
bfdPar0 = fdPar(basis0,lambda=1,int2Lfd(1))
bfdPar.d <- fdPar(basis.d,lambda=1,int2Lfd(1))
DEfd0 <- smooth.basis(times0, yout0, bfdPar0,fdnames=fdnames)$fd
coefs0 <- DEfd0$coefs
colnames(coefs0) = c("S","I")
initPars <- c(5, 0.0012)
names(initPars) <- c("gamma", "beta")
initBeta <- rep(0, 11)
initBeta[c(4,5,11)] <- c(0.611, 0.362, 0.026)
tau <- list(seq(0,1, length.out = 11))
lambda = 1000
DSIRfn <- DSIRfn.make()
## Not run: 
##D dde.fit <- Profile.LS.DDE(DSIRfn, yout.d, times.d, pars = initPars,
##D     beta = initBeta, coefs = DSIRInitCoefs, basisvals = basis.d,
##D     lambda = 1000,
##D     in.meth='nlminb', basisvals0 = basis0, coefs0 = coefs0,
##D     nbeta = length(initBeta), ndelay = 2, tau = tau,
##D     control.out = list(method = "nnls.eq", maxIter = 2, echo = TRUE))
##D     
## End(Not run)



