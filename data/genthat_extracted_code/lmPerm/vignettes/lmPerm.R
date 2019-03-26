### R code from vignette source 'lmPerm.Rnw'

###################################################
### code chunk number 1: lmPerm.Rnw:29-34
###################################################
# needed to make stars output look OK
useFancyQuotesSave<-getOption("useFancyQuotes")
options(useFancyQuotes=FALSE)
widthSave<-getOption("width")
options(width=55)


###################################################
### code chunk number 2: lmPerm.Rnw:140-143
###################################################
library(lmPerm)
data(CC164)
summary(lmp(y~P*N,data=CC164, perm="Exact"))


###################################################
### code chunk number 3: lmPerm.Rnw:166-167
###################################################
summary(lmp(y ~ P * N, data = CC164, perm="Prob"))


###################################################
### code chunk number 4: lmPerm.Rnw:219-220
###################################################
anova(lmp(y~P*N,CC164))


###################################################
### code chunk number 5: lmPerm.Rnw:237-238
###################################################
summary(aovp(y~P*N+Error(Block),CC164))


###################################################
### code chunk number 6: lmPerm.Rnw:251-252
###################################################
data(Hald17.4)


###################################################
### code chunk number 7: lmPerm.Rnw:254-255
###################################################
summary(aovp(Y~T+Error(block),Hald17.4))


###################################################
### code chunk number 8: lmPerm.Rnw:265-266
###################################################
summary(aovp(Y~T+L+Error(block),Hald17.4))


###################################################
### code chunk number 9: lmPerm.Rnw:280-281
###################################################
data(Quinlan)


###################################################
### code chunk number 10: lmPerm.Rnw:309-310
###################################################
summary(lmp(SN~.,Quinlan))


###################################################
### code chunk number 11: lmPerm.Rnw:330-331
###################################################
data(composite)


###################################################
### code chunk number 12: lmPerm.Rnw:333-334
###################################################
anova(lmp(strength~laser*tape,composite))


###################################################
### code chunk number 13: lmPerm.Rnw:356-357
###################################################
data(simDesignPartNumeric)


###################################################
### code chunk number 14: lmPerm.Rnw:359-360
###################################################
anova(lmp(poly.formula(Y~quad(A,B)+C),simDesignPartNumeric))


###################################################
### code chunk number 15: lmPerm.Rnw:368-371
###################################################
poly.formula(Y~quad(A,B,C))
poly.formula(Y~cubic(A,B,C))
poly.formula(Y~cubicS(A,B,C))


###################################################
### code chunk number 16: lmPerm.Rnw:380-381
###################################################
data(Plasma)


###################################################
### code chunk number 17: lmPerm.Rnw:383-384
###################################################
anova(lmp(multResp(Amin,Pct,sinpoly)~.,Plasma))


###################################################
### code chunk number 18: lmPerm.Rnw:395-396
###################################################
data(ghoctane)


###################################################
### code chunk number 19: lmPerm.Rnw:399-400
###################################################
ghoctane


###################################################
### code chunk number 20: lmPerm.Rnw:435-436
###################################################
anova(lmp(ON~.^3-1,ghoctane))


###################################################
### code chunk number 21: lmPerm.Rnw:504-506
###################################################
data(ratGenotype)
replications(~litter*mother,ratGenotype)


###################################################
### code chunk number 22: lmPerm.Rnw:513-514
###################################################
anova(lmp(wt~litter*mother,ratGenotype,seqs=TRUE))


###################################################
### code chunk number 23: lmPerm.Rnw:523-524
###################################################
anova(lmp(wt~litter*mother,ratGenotype,seqs=FALSE))


###################################################
### code chunk number 24: lmPerm.Rnw:543-544
###################################################
anova(lmp(wt~litter*mother,ratGenotype,contrasts=list(mother=contr.treatment(4))))


###################################################
### code chunk number 25: lmPerm.Rnw:580-582
###################################################
data(manly126)
manly126


###################################################
### code chunk number 26: lmPerm.Rnw:898-902
###################################################
options(useFancyQuotes=useFancyQuotesSave)
rm(useFancyQuotesSave)
options(width=widthSave)
rm(widthSave)


