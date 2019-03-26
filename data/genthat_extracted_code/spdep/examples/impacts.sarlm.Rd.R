library(spdep)


### Name: impacts
### Title: Impacts in spatial lag models
### Aliases: impacts impacts.sarlm impacts.stsls impacts.gmsar impacts.SLX
###   impacts.MCMC_sar_g impacts.lagmess plot.lagImpact print.lagImpact
###   summary.lagImpact print.summary.lagImpact print.WXImpact
###   summary.WXImpact print.summary.WXImpact HPDinterval.lagImpact
###   intImpacts
### Keywords: spatial

### ** Examples

if (require(rgdal, quietly=TRUE)) {
example(columbus, package="spData")
listw <- nb2listw(col.gal.nb)
ev <- eigenw(listw)
lobj <- lagsarlm(CRIME ~ INC + HOVAL, columbus, listw,
 control=list(pre_eig=ev))
summary(lobj)
mobj <- lagsarlm(CRIME ~ INC + HOVAL, columbus, listw, Durbin=TRUE,
 control=list(pre_eig=ev))
summary(mobj)
mobj1 <- lagsarlm(CRIME ~ INC + HOVAL, columbus, listw, Durbin= ~ INC,
 control=list(pre_eig=ev))
summary(mobj1)
W <- as(listw, "CsparseMatrix")
trMatc <- trW(W, type="mult")
trMC <- trW(W, type="MC")
set.seed(1)
impacts(lobj, listw=listw)
impacts(lobj, tr=trMatc)
impacts(lobj, tr=trMC)
impacts(lobj, evalues=ev)
lobj1 <- stsls(CRIME ~ INC + HOVAL, columbus, listw)
loobj1 <- impacts(lobj1, R=200, tr=trMatc)
summary(loobj1, zstats=TRUE, short=TRUE)
loobj2 <- impacts(lobj1, R=200, evalues=ev)
summary(loobj2, zstats=TRUE, short=TRUE)
library(coda)
HPDinterval(loobj1)
lobj1r <- stsls(CRIME ~ INC + HOVAL, columbus, listw, robust=TRUE)
loobj1r <- impacts(lobj1r, tr=trMatc, R=200)
summary(loobj1r, zstats=TRUE, short=TRUE)
lobjIQ5 <- impacts(lobj, tr=trMatc, R=200, Q=5)
summary(lobjIQ5, zstats=TRUE, short=TRUE)
summary(lobjIQ5, zstats=TRUE, short=TRUE, reportQ=TRUE)
impacts(mobj, listw=listw)
impacts(mobj, tr=trMatc)
impacts(mobj, tr=trMC)
impacts(mobj1, tr=trMatc)
impacts(mobj1, listw=listw)
try(impacts(mobj, evalues=ev))
summary(impacts(mobj, tr=trMatc, R=200), short=TRUE, zstats=TRUE)
summary(impacts(mobj1, tr=trMatc, R=200), short=TRUE, zstats=TRUE)
xobj <- lmSLX(CRIME ~ INC + HOVAL, columbus, listw)
summary(impacts(xobj))
eobj <- errorsarlm(CRIME ~ INC + HOVAL, columbus, listw, etype="emixed")
summary(impacts(eobj), adjust_k=TRUE)
## Not run: 
##D mobj1 <- lagsarlm(CRIME ~ INC + HOVAL, columbus, listw, type="mixed", 
##D method="Matrix", control=list(fdHess=TRUE))
##D summary(mobj1)
##D set.seed(1)
##D summary(impacts(mobj1, tr=trMatc, R=1000), zstats=TRUE, short=TRUE)
##D summary(impacts(mobj, tr=trMatc, R=1000), zstats=TRUE, short=TRUE)
##D mobj2 <- lagsarlm(CRIME ~ INC + HOVAL, columbus, listw, type="mixed", 
##D method="Matrix", control=list(fdHess=TRUE, optimHess=TRUE))
##D summary(impacts(mobj2, tr=trMatc, R=1000), zstats=TRUE, short=TRUE)
##D mobj3 <- lagsarlm(CRIME ~ INC + HOVAL, columbus, listw, type="mixed", 
##D method="spam", control=list(fdHess=TRUE))
##D summary(impacts(mobj3, tr=trMatc, R=1000), zstats=TRUE, short=TRUE)
## End(Not run)
## Not run: 
##D data(boston, package="spData")
##D Wb <- as(nb2listw(boston.soi), "CsparseMatrix")
##D trMatb <- trW(Wb, type="mult")
##D gp2mMi <- lagsarlm(log(CMEDV) ~ CRIM + ZN + INDUS + CHAS + I(NOX^2) + 
##D I(RM^2) +  AGE + log(DIS) + log(RAD) + TAX + PTRATIO + B + log(LSTAT), 
##D data=boston.c, nb2listw(boston.soi), type="mixed", method="Matrix", 
##D control=list(fdHess=TRUE), trs=trMatb)
##D summary(gp2mMi)
##D summary(impacts(gp2mMi, tr=trMatb, R=1000), zstats=TRUE, short=TRUE)
##D data(house, package="spData")
##D lw <- nb2listw(LO_nb)
##D form <- formula(log(price) ~ age + I(age^2) + I(age^3) + log(lotsize) +
##D    rooms + log(TLA) + beds + syear)
##D lobj <- lagsarlm(form, house, lw, method="Matrix",
##D  control=list(fdHess=TRUE), trs=trMat)
##D summary(lobj)
##D loobj <- impacts(lobj, tr=trMat, R=1000)
##D summary(loobj, zstats=TRUE, short=TRUE)
##D lobj1 <- stsls(form, house, lw)
##D loobj1 <- impacts(lobj1, tr=trMat, R=1000)
##D summary(loobj1, zstats=TRUE, short=TRUE)
##D mobj <- lagsarlm(form, house, lw, type="mixed",
##D  method="Matrix", control=list(fdHess=TRUE), trs=trMat)
##D summary(mobj)
##D moobj <- impacts(mobj, tr=trMat, R=1000)
##D summary(moobj, zstats=TRUE, short=TRUE)
## End(Not run)
}



