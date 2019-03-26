### R code from vignette source 'empirical.Rnw'

###################################################
### code chunk number 1: empirical.Rnw:34-37
###################################################
options(continue=" ")
options(SweaveHooks=list(fig=function()
par(mar=c(4.1, 4.1, 2.6, 1.6), cex=0.7, cex.main=1)))


###################################################
### code chunk number 2: empirical.Rnw:104-108
###################################################
library (intoo)
library (empirical)
library (fclust)
library (moments)


###################################################
### code chunk number 3: empirical.Rnw:115-117
###################################################
data (trees)
data (unemployment)


###################################################
### code chunk number 4: empirical.Rnw:121-127
###################################################
# -> m
Height = 0.3048 * trees$Height
# -> cm
Girth = 2.54 * trees$Girth
# -> m ^ 3
Volume = 0.0283168 * trees$Volume


###################################################
### code chunk number 5: empirical.Rnw:130-134
###################################################
#total unemployment rate
un.rate = unemployment$Total.Rate
#long term unemployment rate
lt.rate = unemployment$LongTerm.Share


###################################################
### code chunk number 6: empirical.Rnw:138-140
###################################################
trees2 = cbind (Height, Girth, Volume)
unemployment2 = cbind (un.rate, lt.rate)


###################################################
### code chunk number 7: empirical.Rnw:149-150
###################################################
f = epdfuv (Height)


###################################################
### code chunk number 8: empirical.Rnw:154-155
###################################################
object.info (f)


###################################################
### code chunk number 9: empirical.Rnw:159-160
###################################################
f %$% x


###################################################
### code chunk number 10: empirical.Rnw:166-168
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (density (Height), ylim=c (0, 0.27) )
lines (f, col="darkgreen")


###################################################
### code chunk number 11: empirical.Rnw:174-176
###################################################
getOption("SweaveHooks")[["fig"]]()
f.75 = epdfuv (Height, drp=0.75)
plot (f.75)


###################################################
### code chunk number 12: empirical.Rnw:183-185
###################################################
mean.Height = mean (Height)
f (mean.Height)


###################################################
### code chunk number 13: empirical.Rnw:191-195
###################################################
getOption("SweaveHooks")[["fig"]]()
mh = emode (f)
plot (f)
abline (v=mh, lty=2)
mh


###################################################
### code chunk number 14: empirical.Rnw:210-214
###################################################
getOption("SweaveHooks")[["fig"]]()
F.unsmooth = ecdfuv (Height, FALSE)
F = F.smooth = ecdfuv (Height)
plot (F.unsmooth)
lines (F.smooth, col="darkgreen")


###################################################
### code chunk number 15: empirical.Rnw:222-223
###################################################
F (22) - F (20)


###################################################
### code chunk number 16: empirical.Rnw:228-232
###################################################
getOption("SweaveHooks")[["fig"]]()
F.inv.unsmooth = ecdfuv.inverse (Height, FALSE)
F.inv = F.inv.smooth = ecdfuv.inverse (Height)
plot (F.inv.unsmooth)
lines (F.inv.smooth, col="darkgreen")


###################################################
### code chunk number 17: empirical.Rnw:239-241
###################################################
median = F.inv (0.5)
median


###################################################
### code chunk number 18: empirical.Rnw:245-246
###################################################
F (median)


###################################################
### code chunk number 19: empirical.Rnw:279-281
###################################################
f = epdfmv (cbind (Height, Volume) )
F = ecdfmv (cbind (Height, Volume) )


###################################################
### code chunk number 20: empirical.Rnw:285-286
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (f)


###################################################
### code chunk number 21: empirical.Rnw:289-290
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (f, TRUE)


###################################################
### code chunk number 22: empirical.Rnw:293-294
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (F)


###################################################
### code chunk number 23: empirical.Rnw:297-298
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (F, TRUE)


###################################################
### code chunk number 24: empirical.Rnw:303-304
###################################################
#plot (f, all=TRUE)


###################################################
### code chunk number 25: empirical.Rnw:324-326
###################################################
f = epdfmv (trees2)
F = ecdfmv (trees2)


###################################################
### code chunk number 26: empirical.Rnw:351-355
###################################################
mean.Girth = mean (Girth)
cf = epdfc (Volume, c (Height=mean.Height, Girth=mean.Girth), trees2)
cF = ecdfc (Volume, c (Height=mean.Height, Girth=mean.Girth), trees2)
cF.inv = ecdfc (Volume, c (Height=mean.Height, Girth=mean.Girth), trees2)


###################################################
### code chunk number 27: empirical.Rnw:359-361 (eval = FALSE)
###################################################
## cf = epdfc ("Volume", c (Height=mean.Height, Girth=mean.Girth), trees2,
##     is.string=TRUE)


###################################################
### code chunk number 28: empirical.Rnw:365-366
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (cf)


###################################################
### code chunk number 29: empirical.Rnw:397-401
###################################################
a = c (20, 20, 0.2)
b = c (30, 24, 0.8)
#(using multivariate model from earlier section)
comb.prob (F, a, b)


###################################################
### code chunk number 30: empirical.Rnw:412-416
###################################################
#(using conditional model from earlier section)
#probability that volume is between
#0.2 and 0.8 cubic meters given mean height
cF (0.8) - cF (0.2)


###################################################
### code chunk number 31: empirical.Rnw:420-425
###################################################
#(using conditional model from earlier section)
#median
cF.inv (0.5)
#lower quartile
cF.inv (0.25)


###################################################
### code chunk number 32: empirical.Rnw:431-436
###################################################
getOption("SweaveHooks")[["fig"]]()
#(again, using conditional model from earlier section)
mh = emode (cf)
plot (cf)
abline (v=mh, lty=2)
mh


###################################################
### code chunk number 33: empirical.Rnw:443-448
###################################################
x = seq (min (Height), max (Height), length.out=30)
y = matrix (0, nrow=30, ncol=3)
for (i in 1:30)
    y [i,] = ecdfc.inverse (Volume, c (Height=x [i]), cbind (Height, Volume),
        npoints=10)(c (0.5, 0.25, 0.75) )


###################################################
### code chunk number 34: empirical.Rnw:452-456
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (Height, Volume)
lines (x, y [,1])
lines (x, y [,2], lty=2)
lines (x, y [,3], lty=2)


###################################################
### code chunk number 35: empirical.Rnw:468-470
###################################################
w = FKM.gk (unemployment2, k=3, seed=2)$U [,1]
w = w / sum (w)


###################################################
### code chunk number 36: empirical.Rnw:479-481
###################################################
getOption("SweaveHooks")[["fig"]]()
f = epdfmv (unemployment2, w=w)
plot (f)


###################################################
### code chunk number 37: empirical.Rnw:484-485
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (f, TRUE)


###################################################
### code chunk number 38: empirical.Rnw:491-494
###################################################
getOption("SweaveHooks")[["fig"]]()
mean.un.rate = mean (un.rate)
cf = epdfc (lt.rate, c (un.rate=mean.un.rate), unemployment2, w=w)
plot (cf)


###################################################
### code chunk number 39: empirical.Rnw:532-534
###################################################
sbcpdf
sbccdf


###################################################
### code chunk number 40: empirical.Rnw:537-538
###################################################
x = seq (-1, 1, length.out=200)


###################################################
### code chunk number 41: empirical.Rnw:542-545
###################################################
getOption("SweaveHooks")[["fig"]]()
y = sbcpdf (x)
plot (x, y, type="l")
abline (v=c (-0.5, 0.5), h=c (0.5), lty=2)


###################################################
### code chunk number 42: empirical.Rnw:550-552
###################################################
getOption("SweaveHooks")[["fig"]]()
y = sbccdf (x)
plot (x, y, type="l")


###################################################
### code chunk number 43: empirical.Rnw:595-600
###################################################
object.info (Height)
object.info (Girth)
object.info (Volume)
summary (trees2)
skewness (trees2)


###################################################
### code chunk number 44: empirical.Rnw:604-605
###################################################
getOption("SweaveHooks")[["fig"]]()
stripchart (Height, "jitter", pch=1)


###################################################
### code chunk number 45: empirical.Rnw:608-609
###################################################
getOption("SweaveHooks")[["fig"]]()
stripchart (Girth, "jitter", pch=1)


###################################################
### code chunk number 46: empirical.Rnw:612-613
###################################################
getOption("SweaveHooks")[["fig"]]()
stripchart (Volume, "jitter", pch=1)


###################################################
### code chunk number 47: empirical.Rnw:616-617
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (Height, Girth)


###################################################
### code chunk number 48: empirical.Rnw:620-621
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (Height, Volume)


###################################################
### code chunk number 49: empirical.Rnw:624-625
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (Girth, Volume)


###################################################
### code chunk number 50: empirical.Rnw:633-637
###################################################
object.info (un.rate)
object.info (lt.rate)
summary (unemployment2)
skewness (unemployment2)


###################################################
### code chunk number 51: empirical.Rnw:641-642
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (unemployment2)


###################################################
### code chunk number 52: empirical.Rnw:651-653
###################################################
getOption("SweaveHooks")[["fig"]]()
s = 1 - w / max (w)
plot (unemployment2, pch=16, col=rgb (s, s, s) )


