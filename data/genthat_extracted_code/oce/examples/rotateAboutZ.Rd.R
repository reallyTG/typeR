library(oce)


### Name: rotateAboutZ
### Title: Rotate velocity components within an oce object
### Aliases: rotateAboutZ

### ** Examples

library(oce)
par(mfcol=c(2, 3))
# adp (acoustic Doppler profiler)
data(adp)
plot(adp, which="uv")
mtext("adp", side=3, line=0, adj=1, cex=0.7)
adpRotated <- rotateAboutZ(adp, 30)
plot(adpRotated, which="uv")
mtext("adp rotated 30 deg", side=3, line=0, adj=1, cex=0.7)
# adv (acoustic Doppler velocimeter)
data(adv)
plot(adv, which="uv")
mtext("adv", side=3, line=0, adj=1, cex=0.7)
advRotated <- rotateAboutZ(adv, 125)
plot(advRotated, which="uv")
mtext("adv rotated 125 deg", side=3, line=0, adj=1, cex=0.7)
# cm (current meter)
data(cm)
plot(cm, which="uv")
mtext("cm", side=3, line=0, adj=1, cex=0.7)
cmRotated <- rotateAboutZ(cm, 30)
plot(cmRotated, which="uv")
mtext("cm rotated 30 deg", side=3, line=0, adj=1, cex=0.7)




