### R code from vignette source 'barsurf.Rnw'

###################################################
### code chunk number 1: barsurf.Rnw:34-37
###################################################
options(continue=" ")
options(SweaveHooks=list(fig=function()
par(mar=c(4.1, 4.1, 2.6, 1.6), cex=0.7, cex.main=1)))


###################################################
### code chunk number 2: barsurf.Rnw:61-63
###################################################
library (barsurf)
library (colorspace)


###################################################
### code chunk number 3: barsurf.Rnw:72-73
###################################################
getOption("SweaveHooks")[["fig"]]()
plot3d.empty ()


###################################################
### code chunk number 4: barsurf.Rnw:85-89
###################################################
getOption("SweaveHooks")[["fig"]]()
x = y = 1:4
f = function (x, y) x ^ 2 + y ^ 2
z = outer (x, y, f)
plot3d.bar (,,z)


###################################################
### code chunk number 5: barsurf.Rnw:96-98
###################################################
getOption("SweaveHooks")[["fig"]]()
px = py = (0:4) ^ 2
plot3d.bar (px, py, z)


###################################################
### code chunk number 6: barsurf.Rnw:105-114
###################################################
col.map = c (
	1, 1, 2, 2,
	1, 1, 2, 2,
	3, 3, 4, 4,
	3, 3, 4, 4)
col1.palette = rainbow_hcl (4, start=140, end=275, l=75)
col2.palette = rainbow_hcl (4, start=140, end=275, l=80)
col1 = matrix (col1.palette [col.map], nrow=4, byrow=TRUE)
col2 = matrix (col2.palette [col.map], nrow=4, byrow=TRUE)


###################################################
### code chunk number 7: barsurf.Rnw:119-120
###################################################
getOption("SweaveHooks")[["fig"]]()
plot3d.bar (,,z, col1=col1, col2=col2)


###################################################
### code chunk number 8: barsurf.Rnw:127-128
###################################################
getOption("SweaveHooks")[["fig"]]()
plot3d.bar (px, py, z, col1=col1, col2=col2)


###################################################
### code chunk number 9: barsurf.Rnw:138-142
###################################################
getOption("SweaveHooks")[["fig"]]()
x = y = 1:4
f = function (x, y) x ^ 2 + y ^ 2
z = outer (x, y, f)
plot3d.surf (,,z)


