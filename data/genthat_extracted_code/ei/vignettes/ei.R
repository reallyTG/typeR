### R code from vignette source 'ei.Rnw'

###################################################
### code chunk number 1: beforepkgs
###################################################
 before<-search()
 ind <- grep("[a-z A-Z]+:ei",before)
 if(!length(ind) > 0) library(ei)


###################################################
### code chunk number 2: ei.Rnw:143-148 (eval = FALSE)
###################################################
## formula = t ~ x
## dbuf <- ei(formula=formula, total="n",data=data)
## summary(dbuf)
## eiread(dbuf, "betab","betaw")
## plot(dbuf, "tomog","betab","betaw","xtfit")


###################################################
### code chunk number 3: ei.Rnw:223-225
###################################################
library(ei)
data(matproii)


###################################################
### code chunk number 4: ei.Rnw:250-252 (eval = FALSE)
###################################################
## formula = t ~ x
## dbuf = ei(formula=formula,total="n",data=matproii)


###################################################
### code chunk number 5: ei.Rnw:259-260 (eval = FALSE)
###################################################
## summary(dbuf)


###################################################
### code chunk number 6: ei.Rnw:301-302 (eval = FALSE)
###################################################
## bb.out <- eiread(dbuf, "betab", "sbetab")


###################################################
### code chunk number 7: ei.Rnw:313-314 (eval = FALSE)
###################################################
## plot(dbuf, "tomog")


###################################################
### code chunk number 8: ei.Rnw:319-322 (eval = FALSE)
###################################################
## png("tomogplot.png", width=6, height=6, pointsize=10)
## plot(dbuf, "tomog")
## invisible(dev.off())


###################################################
### code chunk number 9: ei.Rnw:333-336 (eval = FALSE)
###################################################
## png("tomogplot2.png", width=14, height=6, pointsize=10)
## plot(dbuf, "tomogE", "tomogCI")
## invisible(dev.off())


###################################################
### code chunk number 10: ei.Rnw:349-350 (eval = FALSE)
###################################################
## plot(dbuf, "tomogE","tomogCI")


###################################################
### code chunk number 11: ei.Rnw:357-358 (eval = FALSE)
###################################################
## plot(dbuf, "betab","betaw")


###################################################
### code chunk number 12: ei.Rnw:365-366 (eval = FALSE)
###################################################
## plot(dbuf, "xtfit")


###################################################
### code chunk number 13: ei.Rnw:374-377 (eval = FALSE)
###################################################
## png("betas.png", width=14, height=6, pointsize=10)
## plot(dbuf, "betab", "betaw")
## invisible(dev.off())


###################################################
### code chunk number 14: ei.Rnw:389-392 (eval = FALSE)
###################################################
## png("xtfit.png", width=6, height=6, pointsize=10)
## plot(dbuf, "xtfit")
## invisible(dev.off())


###################################################
### code chunk number 15: ei.Rnw:403-406 (eval = FALSE)
###################################################
## truth = cbind(matproii$tb,matproii$tw)
## formula = t ~ x
## dbuf = ei(formula=formula,total="n",data=matproii,truth=truth)


###################################################
### code chunk number 16: ei.Rnw:411-412 (eval = FALSE)
###################################################
## plot(dbuf, "truth")


###################################################
### code chunk number 17: ei.Rnw:421-424 (eval = FALSE)
###################################################
## png("truth2.png", width=6, height=6, pointsize=10)
## plot(dbuf, "truth")
## invisible(dev.off())


###################################################
### code chunk number 18: ei.Rnw:445-446 (eval = FALSE)
###################################################
## data(RxCdata)


###################################################
### code chunk number 19: ei.Rnw:451-452 (eval = FALSE)
###################################################
## formula <- cbind(turnout, noturnout) ~ cbind(white, black, hisp)


###################################################
### code chunk number 20: ei.Rnw:456-457 (eval = FALSE)
###################################################
## dbuf = ei(formula, data=RxCdata)


###################################################
### code chunk number 21: ei.Rnw:462-464 (eval = FALSE)
###################################################
## out <- dbuf$draws$Beta[,"beta.white.turnout.3"]
## summary(out)


###################################################
### code chunk number 22: ei.Rnw:487-488 (eval = FALSE)
###################################################
## plot(out)


###################################################
### code chunk number 23: ei.Rnw:526-528 (eval = FALSE)
###################################################
## formula <- cbind(turnout, noturnout) ~ cbind(white, black, hisp)
## tomogRxC(formula, RxCdata)


###################################################
### code chunk number 24: ei.Rnw:562-564 (eval = FALSE)
###################################################
## formula <- cbind(turnout, noturnout) ~ cbind(white, hisp, black)
## tomogRxC(formula, RxCdata)


###################################################
### code chunk number 25: ei.Rnw:580-582 (eval = FALSE)
###################################################
## formula <- cbind(turnout, noturnout) ~ cbind(hisp, black, white)
## tomogRxC(formula, RxCdata)


