library(spdep)


### Name: errorsarlm
### Title: Spatial simultaneous autoregressive error model estimation
### Aliases: errorsarlm lmSLX create_WX
### Keywords: spatial

### ** Examples

data(oldcol)
lw <- nb2listw(COL.nb, style="W")
COL.errW.eig <- errorsarlm(CRIME ~ INC + HOVAL, data=COL.OLD,
 lw, method="eigen", quiet=FALSE)
summary(COL.errW.eig)
ev <- eigenw(similar.listw(lw))
COL.errW.eig_ev <- errorsarlm(CRIME ~ INC + HOVAL, data=COL.OLD,
 lw, method="eigen", control=list(pre_eig=ev))
all.equal(coefficients(COL.errW.eig), coefficients(COL.errW.eig_ev))
COL.errB.eig <- errorsarlm(CRIME ~ INC + HOVAL, data=COL.OLD,
 nb2listw(COL.nb, style="B"), method="eigen", quiet=FALSE)
summary(COL.errB.eig)
W <- as(nb2listw(COL.nb), "CsparseMatrix")
trMatc <- trW(W, type="mult")
COL.errW.M <- errorsarlm(CRIME ~ INC + HOVAL, data=COL.OLD,
 lw, method="Matrix", quiet=FALSE, trs=trMatc)
summary(COL.errW.M)
COL.SDEM.eig <- errorsarlm(CRIME ~ INC + HOVAL, data=COL.OLD,
 lw, method="eigen", etype="emixed")
summary(COL.SDEM.eig)
COL.SDEM.eig <- errorsarlm(CRIME ~ INC + HOVAL, data=COL.OLD,
 lw, method="eigen", Durbin=TRUE)
summary(COL.SDEM.eig)
COL.SDEM.eig <- errorsarlm(CRIME ~ DISCBD + INC + HOVAL, data=COL.OLD,
 lw, method="eigen", Durbin=~INC)
summary(COL.SDEM.eig)
summary(impacts(COL.SDEM.eig))
COL.SLX <- lmSLX(CRIME ~ INC + HOVAL, data=COL.OLD, listw=lw)
summary(COL.SLX)
summary(impacts(COL.SLX))
COL.SLX <- lmSLX(CRIME ~ INC + HOVAL + I(HOVAL^2), data=COL.OLD, listw=lw, Durbin=TRUE)
summary(impacts(COL.SLX))
summary(COL.SLX)
COL.SLX <- lmSLX(CRIME ~ INC + HOVAL + I(HOVAL^2), data=COL.OLD, listw=lw, Durbin=~INC)
summary(impacts(COL.SLX))
summary(COL.SLX)
COL.SLX <- lmSLX(CRIME ~ INC, data=COL.OLD, listw=lw)
summary(COL.SLX)
summary(impacts(COL.SLX))
## No test: 
crds <- cbind(COL.OLD$X, COL.OLD$Y)
mdist <- sqrt(sum(diff(apply(crds, 2, range))^2))
dnb <- dnearneigh(crds, 0, mdist)
dists <- nbdists(dnb, crds)
f <- function(x, form, data, dnb, dists, verbose) {
  glst <- lapply(dists, function(d) 1/(d^x))
  lw <- nb2listw(dnb, glist=glst, style="B")
  res <- logLik(lmSLX(form=form, data=data, listw=lw))
  if (verbose) cat("power:", x, "logLik:", res, "\n")
  res
}
opt <- optimize(f, interval=c(0.1, 4), form=CRIME ~ INC + HOVAL,
 data=COL.OLD, dnb=dnb, dists=dists, verbose=TRUE, maximum=TRUE)
glst <- lapply(dists, function(d) 1/(d^opt$maximum))
lw <- nb2listw(dnb, glist=glst, style="B")
SLX <- lmSLX(CRIME ~ INC + HOVAL, data=COL.OLD, listw=lw)
summary(SLX)
summary(impacts(SLX))
## End(No test)
NA.COL.OLD <- COL.OLD
NA.COL.OLD$CRIME[20:25] <- NA
COL.err.NA <- errorsarlm(CRIME ~ INC + HOVAL, data=NA.COL.OLD,
 nb2listw(COL.nb), na.action=na.exclude)
COL.err.NA$na.action
COL.err.NA
resid(COL.err.NA)
## No test: 
lw <- nb2listw(COL.nb, style="W")
system.time(COL.errW.eig <- errorsarlm(CRIME ~ INC + HOVAL, data=COL.OLD,
 lw, method="eigen"))
ocoef <- coefficients(COL.errW.eig)
system.time(COL.errW.eig <- errorsarlm(CRIME ~ INC + HOVAL, data=COL.OLD,
 lw, method="eigen", control=list(LAPACK=FALSE)))
all.equal(ocoef, coefficients(COL.errW.eig))
system.time(COL.errW.eig <- errorsarlm(CRIME ~ INC + HOVAL, data=COL.OLD,
 lw, method="eigen", control=list(compiled_sse=TRUE)))
all.equal(ocoef, coefficients(COL.errW.eig))
system.time(COL.errW.eig <- errorsarlm(CRIME ~ INC + HOVAL, data=COL.OLD,
 lw, method="Matrix_J", control=list(super=TRUE)))
all.equal(ocoef, coefficients(COL.errW.eig))
system.time(COL.errW.eig <- errorsarlm(CRIME ~ INC + HOVAL, data=COL.OLD,
 lw, method="Matrix_J", control=list(super=FALSE)))
all.equal(ocoef, coefficients(COL.errW.eig))
system.time(COL.errW.eig <- errorsarlm(CRIME ~ INC + HOVAL, data=COL.OLD,
 lw, method="Matrix_J", control=list(super=as.logical(NA))))
all.equal(ocoef, coefficients(COL.errW.eig))
system.time(COL.errW.eig <- errorsarlm(CRIME ~ INC + HOVAL, data=COL.OLD,
 lw, method="Matrix", control=list(super=TRUE)))
all.equal(ocoef, coefficients(COL.errW.eig))
system.time(COL.errW.eig <- errorsarlm(CRIME ~ INC + HOVAL, data=COL.OLD,
 lw, method="Matrix", control=list(super=FALSE)))
all.equal(ocoef, coefficients(COL.errW.eig))
system.time(COL.errW.eig <- errorsarlm(CRIME ~ INC + HOVAL, data=COL.OLD,
 lw, method="Matrix", control=list(super=as.logical(NA))))
all.equal(ocoef, coefficients(COL.errW.eig))
system.time(COL.errW.eig <- errorsarlm(CRIME ~ INC + HOVAL, data=COL.OLD,
 lw, method="spam", control=list(spamPivot="MMD")))
all.equal(ocoef, coefficients(COL.errW.eig))
system.time(COL.errW.eig <- errorsarlm(CRIME ~ INC + HOVAL, data=COL.OLD,
 lw, method="spam", control=list(spamPivot="RCM")))
all.equal(ocoef, coefficients(COL.errW.eig))
system.time(COL.errW.eig <- errorsarlm(CRIME ~ INC + HOVAL, data=COL.OLD,
 lw, method="spam_update", control=list(spamPivot="MMD")))
all.equal(ocoef, coefficients(COL.errW.eig))
system.time(COL.errW.eig <- errorsarlm(CRIME ~ INC + HOVAL, data=COL.OLD,
 lw, method="spam_update", control=list(spamPivot="RCM")))
all.equal(ocoef, coefficients(COL.errW.eig))
## End(No test)



