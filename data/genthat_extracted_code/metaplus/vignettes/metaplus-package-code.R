### R code from vignette source 'beath'

###################################################
### code chunk number 1: beath.Rnw:13-15
###################################################
library(metaplus)
set.seed(12345)


###################################################
### code chunk number 2: beath.Rnw:187-189
###################################################
mag.meta <- metaplus(yi, sei, slab = study, data = mag)
summary(mag.meta)


###################################################
### code chunk number 3: profile1
###################################################
mag.meta <- metaplus(mag$yi, mag$sei, slab = mag$study, plotci = TRUE)


###################################################
### code chunk number 4: forest1b
###################################################
plot(mag.meta, atransf = exp, at = log(c(.01, .1, 1, 10, 100)), xlab = "Odds Ratio",
  cex = 0.75)


###################################################
### code chunk number 5: beath.Rnw:219-222
###################################################
mag.tdist <- metaplus(yi, sei, slab = study,
  random = "t-dist", data = mag)
summary(mag.tdist)


###################################################
### code chunk number 6: beath.Rnw:226-227
###################################################
summary(testOutliers(mag.tdist))


###################################################
### code chunk number 7: beath.Rnw:232-236
###################################################
mag.mix <- metaplus(yi, sei, slab = study,
  random = "mixture", data = mag)
summary(mag.mix)
summary(testOutliers(mag.mix))


###################################################
### code chunk number 8: beath.Rnw:243-245
###################################################
cdp.meta <- metaplus(yi, sei, slab = study, data = cdp)
summary(cdp.meta)


###################################################
### code chunk number 9: beath.Rnw:249-253
###################################################
cdp.tdist <- metaplus(yi, sei, slab = study,
  random = "t-dist", data = cdp)
summary(cdp.tdist)
summary(testOutliers(cdp.tdist))


###################################################
### code chunk number 10: beath.Rnw:257-261
###################################################
cdp.mix <- metaplus(yi, sei, slab = study,
  random = "mixture", data = cdp)
summary(cdp.mix)
summary(testOutliers(cdp.mix))


###################################################
### code chunk number 11: beath.Rnw:265-266
###################################################
cdp.mix.outlierProbs <- outlierProbs(cdp.mix)


###################################################
### code chunk number 12: outprob2
###################################################
plot(cdp.mix.outlierProbs)


###################################################
### code chunk number 13: forest2
###################################################
plot(cdp.meta, extrameta = list(cdp.tdist, cdp.mix), xlab = "Standardised Mean Difference")


###################################################
### code chunk number 14: beath.Rnw:298-308
###################################################
exercise.meta <- metaplus(smd, sqrt(varsmd),
  mods = duration, slab = study, data = exercise)
summary(exercise.meta)
exercise.mix <- metaplus(smd, sqrt(varsmd),
  mods = duration, slab = study, random = "mixture",
  data = exercise)
summary(exercise.mix)
exercise.testOutliers <- testOutliers(exercise.mix)
summary(exercise.testOutliers)
exercise.outlierProbs <- outlierProbs(exercise.mix)


###################################################
### code chunk number 15: outprob3
###################################################
plot(exercise.outlierProbs)


###################################################
### code chunk number 16: forest3
###################################################
exercise$duration4 <- exercise$duration-4
exercise$duration8 <- exercise$duration-8
exercise$duration12 <- exercise$duration-12

exercise.nodurn <- metaplus(smd, sqrt(varsmd),
  label = "Random Mixture (No Duration)", slab = study,
  random = "mixture", data = exercise)
exercise.wk4 <- metaplus(smd, sqrt(varsmd),
  mods = duration4, label = "Random Mixture (Week 4)",
  slab = study, random = "mixture", data = exercise)
exercise.wk8 <- metaplus(smd, sqrt(varsmd),
  mods = duration8, label = "Random Mixture (Week 8)",
  slab = study, random = "mixture", data = exercise)
exercise.wk12 <- metaplus(smd, sqrt(varsmd),
  mods = duration12, label = "Random Mixture (Week 12)",
  slab = study, random = "mixture", data = exercise)
plot(exercise.nodurn, extrameta = list(exercise.wk4, exercise.wk8,
  exercise.wk12), xlab = "Effect size")


