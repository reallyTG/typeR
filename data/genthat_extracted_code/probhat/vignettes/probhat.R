### R code from vignette source 'probhat.Rnw'

###################################################
### code chunk number 1: probhat.Rnw:34-38
###################################################
options(continue=" ")
options(SweaveHooks=list(fig=function()
par(mar=c(4.1, 4.1, 2.6, 1.6), cex=0.7, cex.main=1)))
set.seed (1)


###################################################
### code chunk number 2: probhat.Rnw:89-93
###################################################
library (probhat)
library (fclust)
library (moments)
library (scatterplot3d)


###################################################
### code chunk number 3: probhat.Rnw:100-102
###################################################
data (trees)
data (unemployment)


###################################################
### code chunk number 4: probhat.Rnw:105-113
###################################################
#refer to datasets for a description of these variables
#(and converting to metric)
# -> m
Height = 0.3048 * trees$Height
# -> cm
Girth = 2.54 * trees$Girth
# -> m^3
Volume = 0.0283168 * trees$Volume


###################################################
### code chunk number 5: probhat.Rnw:116-121
###################################################
#refer to fclust for a description of these variables
#note that this data set contains three variables
#(however, I'm only using two variables)
un.rate = unemployment$Total.Rate
lt.rate = unemployment$LongTerm.Share


###################################################
### code chunk number 6: probhat.Rnw:125-128
###################################################
trees.2.2 = cbind (Height, Volume)
trees.2.3 = cbind (Height, Girth, Volume)
unemployment.2 = cbind (un.rate, lt.rate)


###################################################
### code chunk number 7: probhat.Rnw:166-167
###################################################
f = nppdfuv (Height)


###################################################
### code chunk number 8: probhat.Rnw:172-173
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (f, TRUE)


###################################################
### code chunk number 9: probhat.Rnw:178-179
###################################################
f (20)


###################################################
### code chunk number 10: probhat.Rnw:185-188
###################################################
npmean (f)
mode.Height = npmode (f)
mode.Height


###################################################
### code chunk number 11: probhat.Rnw:192-194
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (f)
abline (v=mode.Height, lty=2)


###################################################
### code chunk number 12: probhat.Rnw:205-207
###################################################
getOption("SweaveHooks")[["fig"]]()
F = npcdfuv (Height)
plot (F, TRUE)


###################################################
### code chunk number 13: probhat.Rnw:215-216
###################################################
F (22) - F (20)


###################################################
### code chunk number 14: probhat.Rnw:223-225
###################################################
getOption("SweaveHooks")[["fig"]]()
F.inv = npcdfuv.inverse (Height)
plot (F.inv)


###################################################
### code chunk number 15: probhat.Rnw:232-236
###################################################
#median
F.inv (0.5)
#5 number summary
F.inv (c (0, 0.25, 0.5, 0.75, 1) )


###################################################
### code chunk number 16: probhat.Rnw:240-241
###################################################
F (F.inv (0.5) )


###################################################
### code chunk number 17: probhat.Rnw:260-262
###################################################
bvf = nppdfmv (trees.2.2)
bvF = npcdfmv (trees.2.2)


###################################################
### code chunk number 18: probhat.Rnw:268-269
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (bvf)


###################################################
### code chunk number 19: probhat.Rnw:272-273
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (bvf, TRUE)


###################################################
### code chunk number 20: probhat.Rnw:276-277
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (bvF)


###################################################
### code chunk number 21: probhat.Rnw:280-281
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (bvF, TRUE)


###################################################
### code chunk number 22: probhat.Rnw:286-287
###################################################
#plot (f, all=TRUE)


###################################################
### code chunk number 23: probhat.Rnw:291-292
###################################################
bvf (c (20, 0.5) )


###################################################
### code chunk number 24: probhat.Rnw:318-320
###################################################
mvf = nppdfmv (trees.2.3)
mvF = npcdfmv (trees.2.3)


###################################################
### code chunk number 25: probhat.Rnw:355-362
###################################################
median.Height = median (Height)
median.Girth = median (Girth)
cf = nppdfc (Volume ~ c (Height=median.Height, Girth=median.Girth), trees.2.3)
cF = npcdfc (Volume ~ c (Height=median.Height, Girth=median.Girth), trees.2.3)
cF.inv = npcdfc.inverse (
    Volume ~ c (Height=median.Height, Girth=median.Girth),
    trees.2.3)


###################################################
### code chunk number 26: probhat.Rnw:366-367
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (cf)


###################################################
### code chunk number 27: probhat.Rnw:377-379
###################################################
w = FKM.gk (unemployment.2, k=3, seed=2)$U [,1]
w = w / sum (w)


###################################################
### code chunk number 28: probhat.Rnw:388-390
###################################################
getOption("SweaveHooks")[["fig"]]()
wf = nppdfmv (unemployment.2, w=w)
plot (wf)


###################################################
### code chunk number 29: probhat.Rnw:393-394
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (wf, TRUE)


###################################################
### code chunk number 30: probhat.Rnw:421-429
###################################################
#probability that:
#(   20  <= Height <= 30,
#    20  <= Girth  <= 24,
#    0.2 <= Volume <= 0.8
#)
a = c (20, 20, 0.2)
b = c (30, 24, 0.8)
comb.prob (mvF, a, b)


###################################################
### code chunk number 31: probhat.Rnw:440-442
###################################################
chained.inv = chained.npcdfmv.inverse (trees.2.3)
trees.2.rs = nprng (chained.inv, 31)


###################################################
### code chunk number 32: probhat.Rnw:445-448
###################################################
Height.rs = trees.2.rs [,"Height"]
Girth.rs = trees.2.rs [,"Girth"]
Volume.rs = trees.2.rs [,"Volume"]


###################################################
### code chunk number 33: probhat.Rnw:459-462
###################################################
#probability that volume is between 0.2 and 0.8 cubic meters
#given median height and median girth
cF (0.8) - cF (0.2)


###################################################
### code chunk number 34: probhat.Rnw:465-468
###################################################
#median of volume in cubic meters
#given median height and median girth
cF.inv (0.5)


###################################################
### code chunk number 35: probhat.Rnw:472-475
###################################################
#mean of volume in cubic meters
#given median height and median girth
npmean (cf)


###################################################
### code chunk number 36: probhat.Rnw:478-482
###################################################
#mode of volume in cubic meters
#given median height and median girth
mode.Volume.c = npmode (cf)
mode.Volume.c


###################################################
### code chunk number 37: probhat.Rnw:486-488
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (cf)
abline (v=mode.Volume.c, lty=2)


###################################################
### code chunk number 38: probhat.Rnw:496-497
###################################################
x = seq (-1, 1, length.out=200)


###################################################
### code chunk number 39: probhat.Rnw:501-504
###################################################
getOption("SweaveHooks")[["fig"]]()
y = sbc.pdf (x)
plot (x, y, type="l")
abline (v=c (-0.5, 0.5), h=c (0.5), lty=2)


###################################################
### code chunk number 40: probhat.Rnw:509-511
###################################################
getOption("SweaveHooks")[["fig"]]()
y = sbc.cdf (x)
plot (x, y, type="l")


###################################################
### code chunk number 41: probhat.Rnw:537-538
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (marginal (mvf), 3, 1, TRUE)


###################################################
### code chunk number 42: probhat.Rnw:560-562
###################################################
getOption("SweaveHooks")[["fig"]]()
F = eccdf (Height)
plot (F, TRUE)


###################################################
### code chunk number 43: probhat.Rnw:568-570
###################################################
getOption("SweaveHooks")[["fig"]]()
F.inv = eccdf.inverse (Height)
plot (F.inv, TRUE)


###################################################
### code chunk number 44: probhat.Rnw:575-579
###################################################
#median
F.inv (0.5)
#5 number summary
F.inv (c (0, 0.25, 0.5, 0.75, 1) )


###################################################
### code chunk number 45: probhat.Rnw:592-597
###################################################
head (trees.2.3, 3)
tail (trees.2.3, 3)
summary (trees.2.3)
skewness (trees.2.3)
cov (trees.2.3)


###################################################
### code chunk number 46: probhat.Rnw:601-602
###################################################
getOption("SweaveHooks")[["fig"]]()
stripchart (Height, "jitter", pch=1)


###################################################
### code chunk number 47: probhat.Rnw:605-606
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (Height, Volume)


###################################################
### code chunk number 48: probhat.Rnw:609-610
###################################################
getOption("SweaveHooks")[["fig"]]()
scatterplot3d (Height, Girth, Volume, type="h", angle=112.5, pch=16)


###################################################
### code chunk number 49: probhat.Rnw:618-623
###################################################
head (unemployment.2, 3)
tail (unemployment.2, 3)
summary (unemployment.2)
skewness (unemployment.2)
cov (unemployment.2)


###################################################
### code chunk number 50: probhat.Rnw:627-629
###################################################
getOption("SweaveHooks")[["fig"]]()
s = 1 - w / max (w)
plot (unemployment.2, pch=16, col=rgb (s, s, s) )


###################################################
### code chunk number 51: probhat.Rnw:637-642
###################################################
head (trees.2.rs, 3)
tail (trees.2.rs, 3)
summary (trees.2.rs)
skewness (trees.2.rs)
cov (trees.2.rs)


###################################################
### code chunk number 52: probhat.Rnw:646-647
###################################################
getOption("SweaveHooks")[["fig"]]()
stripchart (Height.rs, "jitter", pch=1)


###################################################
### code chunk number 53: probhat.Rnw:650-651
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (Height.rs, Volume.rs)


###################################################
### code chunk number 54: probhat.Rnw:654-655
###################################################
getOption("SweaveHooks")[["fig"]]()
scatterplot3d (Height.rs, Girth.rs, Volume.rs, type="h", angle=112.5, pch=16)


###################################################
### code chunk number 55: probhat.Rnw:677-681
###################################################
getOption("SweaveHooks")[["fig"]]()
reg.mean = reglike (mean (Volume) ~ Height, trees.2.2)
reg.mode = reglike (mode (Volume) ~ Height, trees.2.2)
plot (reg.mean, TRUE)
lines (reg.mode, col="darkgreen")


###################################################
### code chunk number 56: probhat.Rnw:689-695
###################################################
getOption("SweaveHooks")[["fig"]]()
reg.median = reglike (median (Volume) ~ Height, trees.2.2)
reg.q.25= reglike (quantile (Volume, 0.25) ~ Height, trees.2.2)
reg.q.75= reglike (quantile (Volume, 0.75) ~ Height, trees.2.2)
plot (reg.median, TRUE)
lines (reg.q.25, col="darkgreen")
lines (reg.q.75, col="darkgreen")


