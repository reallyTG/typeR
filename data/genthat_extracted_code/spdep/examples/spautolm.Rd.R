library(spdep)


### Name: spautolm
### Title: Spatial conditional and simultaneous autoregression model
###   estimation
### Aliases: spautolm residuals.spautolm deviance.spautolm coef.spautolm
###   fitted.spautolm print.spautolm summary.spautolm LR1.spautolm
###   logLik.spautolm print.summary.spautolm
### Keywords: spatial

### ** Examples

## Not run: 
##D if (require(foreign, quietly=TRUE)) {
##D example(NY_data, package="spData")
##D lm0 <- lm(Z ~ PEXPOSURE + PCTAGE65P + PCTOWNHOME, data=nydata)
##D summary(lm0)
##D lm0w <- lm(Z ~ PEXPOSURE + PCTAGE65P + PCTOWNHOME, data=nydata, weights=POP8)
##D summary(lm0w)
##D esar0 <- errorsarlm(Z ~ PEXPOSURE + PCTAGE65P + PCTOWNHOME, data=nydata,
##D  listw=listw_NY)
##D summary(esar0)
##D system.time(esar1f <- spautolm(Z ~ PEXPOSURE + PCTAGE65P + PCTOWNHOME,
##D  data=nydata, listw=listw_NY, family="SAR", method="eigen", verbose=TRUE))
##D res <- summary(esar1f)
##D print(res)
##D sqrt(diag(res$resvar))
##D sqrt(diag(esar1f$fit$imat)*esar1f$fit$s2)
##D sqrt(diag(esar1f$fdHess))
##D system.time(esar1M <- spautolm(Z ~ PEXPOSURE + PCTAGE65P + PCTOWNHOME,
##D  data=nydata, listw=listw_NY, family="SAR", method="Matrix", verbose=TRUE))
##D summary(esar1M)
##D system.time(esar1M <- spautolm(Z ~ PEXPOSURE + PCTAGE65P + PCTOWNHOME,
##D  data=nydata, listw=listw_NY, family="SAR", method="Matrix", verbose=TRUE,
##D  control=list(super=TRUE)))
##D summary(esar1M)
##D esar1wf <- spautolm(Z ~ PEXPOSURE + PCTAGE65P + PCTOWNHOME, data=nydata,
##D  listw=listw_NY, weights=POP8, family="SAR", method="eigen")
##D summary(esar1wf)
##D system.time(esar1wM <- spautolm(Z ~ PEXPOSURE + PCTAGE65P + PCTOWNHOME,
##D  data=nydata, listw=listw_NY, weights=POP8, family="SAR", method="Matrix"))
##D summary(esar1wM)
##D esar1wlu <- spautolm(Z ~ PEXPOSURE + PCTAGE65P + PCTOWNHOME, data=nydata,
##D  listw=listw_NY, weights=POP8, family="SAR", method="LU")
##D summary(esar1wlu)
##D esar1wch <- spautolm(Z ~ PEXPOSURE + PCTAGE65P + PCTOWNHOME, data=nydata,
##D  listw=listw_NY, weights=POP8, family="SAR", method="Chebyshev")
##D summary(esar1wch)
##D ecar1f <- spautolm(Z ~ PEXPOSURE + PCTAGE65P + PCTOWNHOME, data=nydata,
##D  listw=listw_NY, family="CAR", method="eigen")
##D summary(ecar1f)
##D system.time(ecar1M <- spautolm(Z ~ PEXPOSURE + PCTAGE65P + PCTOWNHOME,
##D  data=nydata, listw=listw_NY, family="CAR", method="Matrix"))
##D summary(ecar1M)
##D ecar1wf <- spautolm(Z ~ PEXPOSURE + PCTAGE65P + PCTOWNHOME, data=nydata,
##D  listw=listw_NY, weights=nydata$POP8, family="CAR", method="eigen")
##D summary(ecar1wf)
##D system.time(ecar1wM <- spautolm(Z ~ PEXPOSURE + PCTAGE65P + PCTOWNHOME,
##D  data=nydata, listw=listw_NY, weights=POP8, family="CAR", method="Matrix"))
##D summary(ecar1wM)
##D }
## End(Not run)
if (require(rgdal, quietly=TRUE)) {
example(nc.sids, package="spData")
ft.SID74 <- sqrt(1000)*(sqrt(nc.sids$SID74/nc.sids$BIR74) +
 sqrt((nc.sids$SID74+1)/nc.sids$BIR74))
lm_nc <- lm(ft.SID74 ~ 1)
sids.nhbr30 <- dnearneigh(cbind(nc.sids$east, nc.sids$north), 0, 30, row.names=row.names(nc.sids))
sids.nhbr30.dist <- nbdists(sids.nhbr30, cbind(nc.sids$east, nc.sids$north))
sids.nhbr <- listw2sn(nb2listw(sids.nhbr30, glist=sids.nhbr30.dist, style="B", zero.policy=TRUE))
dij <- sids.nhbr[,3]
n <- nc.sids$BIR74
el1 <- min(dij)/dij
el2 <- sqrt(n[sids.nhbr$to]/n[sids.nhbr$from])
sids.nhbr$weights <- el1*el2
sids.nhbr.listw <- sn2listw(sids.nhbr)
both <- factor(paste(nc.sids$L_id, nc.sids$M_id, sep=":"))
ft.NWBIR74 <- sqrt(1000)*(sqrt(nc.sids$NWBIR74/nc.sids$BIR74) +
 sqrt((nc.sids$NWBIR74+1)/nc.sids$BIR74))
mdata <- data.frame(both, ft.NWBIR74, ft.SID74, BIR74=nc.sids$BIR74)
outl <- which.max(rstandard(lm_nc))
as.character(nc.sids$names[outl])
mdata.4 <- mdata[-outl,]
W <- listw2mat(sids.nhbr.listw)
W.4 <- W[-outl, -outl]
sids.nhbr.listw.4 <- mat2listw(W.4)
esarI <- errorsarlm(ft.SID74 ~ 1, data=mdata, listw=sids.nhbr.listw,
 zero.policy=TRUE)
summary(esarI)
esarIa <- spautolm(ft.SID74 ~ 1, data=mdata, listw=sids.nhbr.listw,
 family="SAR")
summary(esarIa)
esarIV <- errorsarlm(ft.SID74 ~ ft.NWBIR74, data=mdata, listw=sids.nhbr.listw,
 zero.policy=TRUE)
summary(esarIV)
esarIVa <- spautolm(ft.SID74 ~ ft.NWBIR74, data=mdata, listw=sids.nhbr.listw,
 family="SAR")
summary(esarIVa)
esarIaw <- spautolm(ft.SID74 ~ 1, data=mdata, listw=sids.nhbr.listw,
 weights=BIR74, family="SAR")
summary(esarIaw)
esarIIaw <- spautolm(ft.SID74 ~ both - 1, data=mdata, listw=sids.nhbr.listw,
 weights=BIR74, family="SAR")
summary(esarIIaw)
esarIVaw <- spautolm(ft.SID74 ~ ft.NWBIR74, data=mdata,
 listw=sids.nhbr.listw, weights=BIR74, family="SAR")
summary(esarIVaw)
ecarIaw <- spautolm(ft.SID74 ~ 1, data=mdata.4, listw=sids.nhbr.listw.4,
 weights=BIR74, family="CAR")
summary(ecarIaw)
ecarIIaw <- spautolm(ft.SID74 ~ both - 1, data=mdata.4,
 listw=sids.nhbr.listw.4, weights=BIR74, family="CAR")
summary(ecarIIaw)
ecarIVaw <- spautolm(ft.SID74 ~ ft.NWBIR74, data=mdata.4,
 listw=sids.nhbr.listw.4, weights=BIR74, family="CAR")
summary(ecarIVaw)
nc.sids$fitIV <- append(fitted.values(ecarIVaw), NA, outl-1)
spplot(nc.sids, c("fitIV"), cuts=12) # Cressie 1993, p. 565
}
## Not run: 
##D data(oldcol)
##D COL.errW.eig <- errorsarlm(CRIME ~ INC + HOVAL, data=COL.OLD,
##D  nb2listw(COL.nb, style="W"))
##D summary(COL.errW.eig)
##D COL.errW.sar <- spautolm(CRIME ~ INC + HOVAL, data=COL.OLD,
##D  nb2listw(COL.nb, style="W"))
##D summary(COL.errW.sar)
##D data(boston, package="spData")
##D gp1 <- spautolm(log(CMEDV) ~ CRIM + ZN + INDUS + CHAS + I(NOX^2)
##D  + I(RM^2) + AGE + log(DIS) + log(RAD) + TAX + PTRATIO + B + log(LSTAT), 
##D  data=boston.c, nb2listw(boston.soi), family="SMA")
##D summary(gp1)
## End(Not run)



