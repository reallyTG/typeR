library(spdep)


### Name: lagsarlm
### Title: Spatial simultaneous autoregressive lag model estimation
### Aliases: lagsarlm spBreg_lag
### Keywords: spatial

### ** Examples

data(oldcol)
listw <- nb2listw(COL.nb, style="W")
ev <- eigenw(listw)
W <- as(listw, "CsparseMatrix")
trMatc <- trW(W, type="mult")
COL.lag.eig <- lagsarlm(CRIME ~ INC + HOVAL, data=COL.OLD, listw=listw,
 method="eigen", quiet=FALSE, control=list(pre_eig=ev, OrdVsign=1))
summary(COL.lag.eig, correlation=TRUE)
## Not run: 
##D COL.lag.eig$fdHess
##D COL.lag.eig$resvar
##D # using the apparent sign in Ord (1975, equation B.1) 
##D COL.lag.eigb <- lagsarlm(CRIME ~ INC + HOVAL, data=COL.OLD, listw=listw,
##D  method="eigen", control=list(pre_eig=ev, OrdVsign=-1))
##D summary(COL.lag.eigb)
##D COL.lag.eigb$fdHess
##D COL.lag.eigb$resvar
##D # force numerical Hessian
##D COL.lag.eig1 <- lagsarlm(CRIME ~ INC + HOVAL, data=COL.OLD,
##D  listw=listw, method="Matrix", control=list(small=25))
##D summary(COL.lag.eig1)
##D COL.lag.eig1$fdHess
##D # force LeSage & Pace (2008, p. 57) approximation 
##D COL.lag.eig1a <- lagsarlm(CRIME ~ INC + HOVAL, data=COL.OLD,
##D  listw=listw, method="Matrix", control=list(small=25), trs=trMatc)
##D summary(COL.lag.eig1a)
##D COL.lag.eig1a$fdHess
##D COL.lag.eig$resvar[2,2]
##D # using the apparent sign in Ord (1975, equation B.1) 
##D COL.lag.eigb$resvar[2,2]
##D # force numerical Hessian
##D COL.lag.eig1$fdHess[1,1]
##D # force LeSage & Pace (2008, p. 57) approximation 
##D COL.lag.eig1a$fdHess[2,2]
## End(Not run)
system.time(COL.lag.M <- lagsarlm(CRIME ~ INC + HOVAL, data=COL.OLD,
 nb2listw(COL.nb), method="Matrix", quiet=FALSE))
summary(COL.lag.M)
impacts(COL.lag.M, listw=nb2listw(COL.nb))
## Not run: 
##D system.time(COL.lag.sp <- lagsarlm(CRIME ~ INC + HOVAL, data=COL.OLD,
##D  nb2listw(COL.nb), method="spam", quiet=FALSE))
##D summary(COL.lag.sp)
## End(Not run)
COL.lag.B <- lagsarlm(CRIME ~ INC + HOVAL, data=COL.OLD,
 nb2listw(COL.nb, style="B"))
summary(COL.lag.B)
COL.mixed.B <- lagsarlm(CRIME ~ INC + HOVAL, data=COL.OLD,
 nb2listw(COL.nb, style="B"), type="mixed", tol.solve=1e-9,
 control=list(pre_eig=ev))
summary(COL.mixed.B)
COL.mixed.W <- lagsarlm(CRIME ~ INC + HOVAL, data=COL.OLD,
 listw, type="mixed",
 control=list(pre_eig=ev))
summary(COL.mixed.W)
COL.mixed.D00 <- lagsarlm(CRIME ~ INC + HOVAL, data=COL.OLD,
 listw, Durbin=TRUE,
 control=list(pre_eig=ev))
summary(COL.mixed.D00)
COL.mixed.D01 <- lagsarlm(CRIME ~ INC + HOVAL, data=COL.OLD,
 listw, Durbin=FALSE,
 control=list(pre_eig=ev))
summary(COL.mixed.D01)
COL.mixed.D1 <- lagsarlm(CRIME ~ INC + HOVAL, data=COL.OLD,
 listw, Durbin= ~ INC + HOVAL,
 control=list(pre_eig=ev))
summary(COL.mixed.D1)
f <- CRIME ~ INC + HOVAL
COL.mixed.D2 <- lagsarlm(f, data=COL.OLD, listw,
 Durbin=as.formula(delete.response(terms(f))),
 control=list(pre_eig=ev))
summary(COL.mixed.D2)
COL.mixed.D1a <- lagsarlm(CRIME ~ INC + HOVAL, data=COL.OLD,
 listw, Durbin= ~ INC,
 control=list(pre_eig=ev))
summary(COL.mixed.D1a)
try(COL.mixed.D1 <- lagsarlm(CRIME ~ INC + HOVAL, data=COL.OLD,
 listw, Durbin= ~ inc + HOVAL,
 control=list(pre_eig=ev)))
try(COL.mixed.D1 <- lagsarlm(CRIME ~ INC + HOVAL, data=COL.OLD,
 listw, Durbin= ~ DISCBD + HOVAL,
 control=list(pre_eig=ev)))
NA.COL.OLD <- COL.OLD
NA.COL.OLD$CRIME[20:25] <- NA
COL.lag.NA <- lagsarlm(CRIME ~ INC + HOVAL, data=NA.COL.OLD,
 nb2listw(COL.nb), na.action=na.exclude, 
 control=list(tol.opt=.Machine$double.eps^0.4))
COL.lag.NA$na.action
COL.lag.NA
resid(COL.lag.NA)
## Not run: 
##D data(boston, package="spData")
##D gp2mM <- lagsarlm(log(CMEDV) ~ CRIM + ZN + INDUS + CHAS + I(NOX^2) + 
##D I(RM^2) +  AGE + log(DIS) + log(RAD) + TAX + PTRATIO + B + log(LSTAT), 
##D data=boston.c, nb2listw(boston.soi), type="mixed", method="Matrix")
##D summary(gp2mM)
##D W <- as(nb2listw(boston.soi), "CsparseMatrix")
##D trMatb <- trW(W, type="mult")
##D gp2mMi <- lagsarlm(log(CMEDV) ~ CRIM + ZN + INDUS + CHAS + I(NOX^2) + 
##D I(RM^2) +  AGE + log(DIS) + log(RAD) + TAX + PTRATIO + B + log(LSTAT), 
##D data=boston.c, nb2listw(boston.soi), type="mixed", method="Matrix", 
##D trs=trMatb)
##D summary(gp2mMi)
## End(Not run)
## Not run: 
##D set.seed(1)
##D COL.lag.Bayes <- spBreg_lag(CRIME ~ INC + HOVAL, data=COL.OLD,
##D  listw=listw)
##D summary(COL.lag.Bayes)
##D summary(impacts(COL.lag.Bayes, tr=trMatc), short=TRUE, zstats=TRUE)
##D summary(impacts(COL.lag.Bayes, evalues=ev), short=TRUE, zstats=TRUE)
##D set.seed(1)
##D COL.D0.Bayes <- spBreg_lag(CRIME ~ INC + HOVAL, data=COL.OLD,
##D  listw=listw, Durbin=TRUE)
##D summary(COL.D0.Bayes)
##D summary(impacts(COL.D0.Bayes, tr=trMatc), short=TRUE, zstats=TRUE)
## End(Not run)
set.seed(1)
COL.D1.Bayes <- spBreg_lag(CRIME ~ DISCBD + INC + HOVAL, data=COL.OLD,
 listw=listw, Durbin= ~ INC)
summary(COL.D1.Bayes)
summary(impacts(COL.D1.Bayes, tr=trMatc), short=TRUE, zstats=TRUE)
## Not run: 
##D data(elect80, package="spData")
##D lw <- nb2listw(e80_queen, zero.policy=TRUE)
##D el_ml <- lagsarlm(log(pc_turnout) ~ log(pc_college) + log(pc_homeownership)
##D  + log(pc_income), data=elect80, listw=lw, zero.policy=TRUE, method="LU")
##D summary(el_ml)
##D set.seed(1)
##D el_B <- spBreg_lag(log(pc_turnout) ~ log(pc_college) + log(pc_homeownership)
##D  + log(pc_income), data=elect80, listw=lw, zero.policy=TRUE)
##D summary(el_B)
##D el_ml$timings
##D attr(el_B, "timings")
## End(Not run)



