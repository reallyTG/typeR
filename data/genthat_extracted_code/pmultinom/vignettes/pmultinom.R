### R code from vignette source 'pmultinom.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: pmultinom.Rnw:37-40
###################################################
library(pmultinom)
ncells <- 204
subclone.freqs <- c(43, 20, 82, 17, 5, 37)/ncells


###################################################
### code chunk number 2: pmultinom.Rnw:43-44
###################################################
target.number <- c(2, 2, 2, 2, 2, 0)


###################################################
### code chunk number 3: pmultinom.Rnw:47-48
###################################################
lower.bound <- target.number - 1


###################################################
### code chunk number 4: pmultinom.Rnw:51-52
###################################################
pmultinom(lower=lower.bound, size=ncells, probs=subclone.freqs, method="exact")


###################################################
### code chunk number 5: pmultinom.Rnw:55-60
###################################################
xvals <- 0:450
path <- pmultinom(lower=lower.bound, size=xvals, probs=subclone.freqs, method="exact")
plot(xvals, path, type='l',
     main="Probability of observing >=2 from each clone",
     xlab="number of cells", ylab="probability")


###################################################
### code chunk number 6: pmultinom.Rnw:63-65
###################################################
invert.pmultinom(lower=lower.bound, probs=subclone.freqs,
                 target.prob=.95, method="exact")


