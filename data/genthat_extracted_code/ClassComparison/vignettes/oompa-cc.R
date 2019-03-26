### R code from vignette source 'oompa-cc.Rnw'

###################################################
### code chunk number 1: lib
###################################################
library(ClassComparison)


###################################################
### code chunk number 2: simu
###################################################
set.seed(6781252) # for reproducibility
nGenes <- 5000
nSamp <- 15
nDif <- 150
delta <- 1
fake.class <- factor(rep(c('A', 'B'), each=nSamp))
fake.data <- matrix(rnorm(nGenes*nSamp*2), nrow=nGenes, ncol=2*nSamp)
fake.data[1:nDif, 1:nSamp] <- fake.data[1:nDif, 1:nSamp] + delta
fake.data[(nDif+1):(2*nDif), 1:nSamp] <- fake.data[(nDif+1):(2*nDif),
                                                   1:nSamp] - delta


###################################################
### code chunk number 3: mtt
###################################################
mtt <- MultiTtest(fake.data, fake.class)
summary(mtt)


###################################################
### code chunk number 4: hist
###################################################
hist(mtt, breaks=101)


###################################################
### code chunk number 5: bum
###################################################
bum <- Bum(mtt@p.values)
summary(bum)


###################################################
### code chunk number 6: fbum
###################################################
hist(bum)
abline(v=0.05, col="purple", lwd=2)


###################################################
### code chunk number 7: fbum2
###################################################
image(bum)



###################################################
### code chunk number 8: fdr
###################################################
cutoffSignificant(bum, alpha=0.10, by="FDR")


###################################################
### code chunk number 9: fdr2
###################################################
countSignificant(bum, alpha=0.10, by="FDR")


###################################################
### code chunk number 10: calls
###################################################
selected <- selectSignificant(bum, alpha=0.10, by="FDR")


###################################################
### code chunk number 11: truth
###################################################
truth <- rep(FALSE, nGenes)
truth[1:(2*nDif)] <- TRUE
sum(selected & truth)
mean(!truth[selected])


###################################################
### code chunk number 12: mw
###################################################
mw <- MultiWilcoxonTest(fake.data, fake.class)
summary(mw)


###################################################
### code chunk number 13: mwf
###################################################
hist(mw)


###################################################
### code chunk number 14: wil2
###################################################
plot(mw)
abline(h=0)


###################################################
### code chunk number 15: wil3
###################################################
plot(mw, prior=0.92, signif=0.9)
abline(h=0)


###################################################
### code chunk number 16: wilie
###################################################
cutoffSignificant(mw, prior=0.94, signif=0.8)
countSignificant(mw, prior=0.94, signif=0.8)
wilsel <- selectSignificant(mw, prior=0.94, signif=0.8)
sum(selected & wilsel)
sum(truth & wilsel)


###################################################
### code chunk number 17: dud
###################################################
dudoit <- Dudoit(fake.data, fake.class, nPerm=100)
summary(dudoit)


###################################################
### code chunk number 18: dudf
###################################################
plot(dudoit)


###################################################
### code chunk number 19: sig
###################################################
countSignificant(dudoit, 0.10)


###################################################
### code chunk number 20: sam
###################################################
sam <- Sam(fake.data, fake.class)
summary(sam)


###################################################
### code chunk number 21: fsam
###################################################
plot(sam, tracks=seq(0.5, 2, by=0.5))


###################################################
### code chunk number 22: samsig
###################################################
cutoff <- 1
countSignificant(sam, cutoff)
sum(selectSignificant(sam, cutoff) & truth)


