### R code from vignette source 'bivariate.Rnw'

###################################################
### code chunk number 1: bivariate.Rnw:34-37
###################################################
options(continue=" ")
options(SweaveHooks=list(fig=function()
par(mar=c(4.1, 4.1, 2.6, 1.6), cex=0.7, cex.main=1)))


###################################################
### code chunk number 2: bivariate.Rnw:91-94
###################################################
library (intoo)
library (bivariate)
library (moments)


###################################################
### code chunk number 3: bivariate.Rnw:103-104
###################################################
f = dubvpmf (1, 10, 1, 10)


###################################################
### code chunk number 4: bivariate.Rnw:108-109
###################################################
object.info (f)


###################################################
### code chunk number 5: bivariate.Rnw:113-114
###################################################
f %$% n


###################################################
### code chunk number 6: bivariate.Rnw:120-121
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (f)


###################################################
### code chunk number 7: bivariate.Rnw:128-130
###################################################
getOption("SweaveHooks")[["fig"]]()
F = dubvcdf (1, 10, 1, 10)
plot (F)


###################################################
### code chunk number 8: bivariate.Rnw:136-137
###################################################
f (1, 1)


###################################################
### code chunk number 9: bivariate.Rnw:158-160
###################################################
getOption("SweaveHooks")[["fig"]]()
f = bnbvpmf (20, 0.5, 0.5)
plot (f)


###################################################
### code chunk number 10: bivariate.Rnw:167-169
###################################################
getOption("SweaveHooks")[["fig"]]()
F = bnbvcdf (20, 0.5, 0.5)
plot (F)


###################################################
### code chunk number 11: bivariate.Rnw:191-193
###################################################
getOption("SweaveHooks")[["fig"]]()
f = pbvpmf (8, 8, 2)
plot (f)


###################################################
### code chunk number 12: bivariate.Rnw:202-204
###################################################
getOption("SweaveHooks")[["fig"]]()
F = pbvcdf (8, 8, 2)
plot (F)


###################################################
### code chunk number 13: bivariate.Rnw:216-218
###################################################
getOption("SweaveHooks")[["fig"]]()
f = cubvpdf (0, 1, 0, 1)
plot (f)


###################################################
### code chunk number 14: bivariate.Rnw:221-222
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (f, TRUE)


###################################################
### code chunk number 15: bivariate.Rnw:229-231
###################################################
getOption("SweaveHooks")[["fig"]]()
F = cubvcdf (0, 1, 0, 1)
plot (F)


###################################################
### code chunk number 16: bivariate.Rnw:234-235
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (F, TRUE)


###################################################
### code chunk number 17: bivariate.Rnw:246-247
###################################################
f = nbvpdf (0, 0, 1, 1, 0)


###################################################
### code chunk number 18: bivariate.Rnw:252-253
###################################################
#f = nbvpdf (mean.x, mean,y, sd.x ^ 2, sd.y ^ 2, sd.x * sd.y * cor.xy)


###################################################
### code chunk number 19: bivariate.Rnw:257-258
###################################################
object.info (f)


###################################################
### code chunk number 20: bivariate.Rnw:264-265
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (f)


###################################################
### code chunk number 21: bivariate.Rnw:268-269
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (f, TRUE)


###################################################
### code chunk number 22: bivariate.Rnw:275-276
###################################################
F = nbvcdf (0, 0, 1, 1, 0)


###################################################
### code chunk number 23: bivariate.Rnw:280-281
###################################################
#F = nbvcdf (mean.x, mean,y, sd.x ^ 2, sd.y ^ 2, sd.x * sd.y * cor.xy)


###################################################
### code chunk number 24: bivariate.Rnw:287-288
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (F)


###################################################
### code chunk number 25: bivariate.Rnw:291-292
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (F, TRUE)


###################################################
### code chunk number 26: bivariate.Rnw:304-305
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (f, all=TRUE)


###################################################
### code chunk number 27: bivariate.Rnw:314-316
###################################################
getOption("SweaveHooks")[["fig"]]()
f2 = nbvpdf (0, 0, 1, 1, 0.75)
plot (f2, all=TRUE)


###################################################
### code chunk number 28: bivariate.Rnw:323-325
###################################################
getOption("SweaveHooks")[["fig"]]()
f3 = nbvpdf (0, 0, 1, 1, -0.75)
plot (f3, all=TRUE)


###################################################
### code chunk number 29: bivariate.Rnw:337-339
###################################################
getOption("SweaveHooks")[["fig"]]()
f = bmbvpdf (3.5, 0, 1, 1, 6.5, 0, 1, 1)
plot (f)


###################################################
### code chunk number 30: bivariate.Rnw:342-343
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (f, TRUE, npoints=40)


###################################################
### code chunk number 31: bivariate.Rnw:350-352
###################################################
getOption("SweaveHooks")[["fig"]]()
F = bmbvcdf (3.5, 0, 1, 1, 6.5, 0, 1, 1)
plot (F)


###################################################
### code chunk number 32: bivariate.Rnw:355-356
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (F, TRUE, npoints=40)


###################################################
### code chunk number 33: bivariate.Rnw:368-369
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (f, npoints=20, all=TRUE)


###################################################
### code chunk number 34: bivariate.Rnw:377-379
###################################################
getOption("SweaveHooks")[["fig"]]()
f2 = bmbvpdf (3.5, 3.5, 1, 1, 6.5, 6.5, 1, 1)
plot (f2, npoints=20, all=TRUE)


###################################################
### code chunk number 35: bivariate.Rnw:385-387
###################################################
getOption("SweaveHooks")[["fig"]]()
f3 = bmbvpdf (3.5, -3.5, 1, 1, 6.5, -6.5, 1, 1)
plot (f3, npoints=20, all=TRUE)


###################################################
### code chunk number 36: bivariate.Rnw:400-402
###################################################
data ("geyser", package="MASS")
attach (geyser)


###################################################
### code chunk number 37: bivariate.Rnw:405-406
###################################################
f = kbvpdf (duration, waiting, 0.7, 7)


###################################################
### code chunk number 38: bivariate.Rnw:410-411
###################################################
object.info (f)


###################################################
### code chunk number 39: bivariate.Rnw:417-419
###################################################
getOption("SweaveHooks")[["fig"]]()

plot (f, xlab="duration", ylab="waiting")


###################################################
### code chunk number 40: bivariate.Rnw:422-423
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (f, TRUE, xlab="duration", ylab="waiting")


###################################################
### code chunk number 41: bivariate.Rnw:430-432
###################################################
getOption("SweaveHooks")[["fig"]]()
F = kbvcdf (duration, waiting, 0.7, 7)
plot (F, xlab="duration", ylab="waiting")


###################################################
### code chunk number 42: bivariate.Rnw:435-436
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (F, TRUE, xlab="duration", ylab="waiting")


###################################################
### code chunk number 43: bivariate.Rnw:484-489
###################################################
getOption("SweaveHooks")[["fig"]]()
str (geyser)
summary (geyser)
cov (geyser)
skewness (geyser)
plot (duration, waiting)


