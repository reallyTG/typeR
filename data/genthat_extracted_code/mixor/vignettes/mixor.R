### R code from vignette source 'mixor.Rnw'

###################################################
### code chunk number 1: mixor.Rnw:159-160
###################################################
options(prompt = "R> ", continue = "+  ", width = 70, useFancyQuotes = FALSE)


###################################################
### code chunk number 2: mixor.Rnw:162-166
###################################################
library("mixor")
data("schizophrenia")
SCHIZO1.fit <- mixor(imps79o ~ TxDrug + SqrtWeek + TxSWeek, 
  data = schizophrenia, id = id, link = "logit")


###################################################
### code chunk number 3: mixor.Rnw:171-172
###################################################
summary(SCHIZO1.fit)


###################################################
### code chunk number 4: mixor.Rnw:175-178
###################################################
print(SCHIZO1.fit)
coef(SCHIZO1.fit)
vcov(SCHIZO1.fit)


###################################################
### code chunk number 5: mixor.Rnw:182-186
###################################################
cm <- matrix(c(-1, 0, 0, 0, 0, 0, 0,
  -1, 0, 0, 0, 0, 1, 0, 
  -1, 0, 0, 0, 0, 0, 1), ncol = 3)
Contrasts(SCHIZO1.fit, contrast.matrix = cm)


###################################################
### code chunk number 6: mixor.Rnw:191-192
###################################################
plot(SCHIZO1.fit)


###################################################
### code chunk number 7: mixor.Rnw:198-202
###################################################
pihat <- predict(SCHIZO1.fit)
names(pihat)
table(pihat$class, schizophrenia$imps79o)
head(pihat$predicted)


###################################################
### code chunk number 8: mixor.Rnw:207-210
###################################################
SCHIZO2.fit <- mixor(imps79o ~ TxDrug + SqrtWeek + TxSWeek, 
  data = schizophrenia, id = id, which.random.slope = 2, link = "logit")
summary(SCHIZO2.fit)


###################################################
### code chunk number 9: mixor.Rnw:213-214
###################################################
names(SCHIZO2.fit)


###################################################
### code chunk number 10: mixor.Rnw:217-221
###################################################
logLik(SCHIZO1.fit)
deviance(SCHIZO1.fit)
AIC(SCHIZO1.fit)
BIC(SCHIZO1.fit)


###################################################
### code chunk number 11: mixor.Rnw:225-229
###################################################
SCHIZO3.fit <- mixor(imps79o ~ TxDrug + SqrtWeek + TxSWeek, 
  data = schizophrenia, id = id, which.random.slope = 2, indep.re = TRUE, 
  link = "logit")
summary(SCHIZO3.fit)


###################################################
### code chunk number 12: mixor.Rnw:254-260
###################################################
data("SmokeOnset")
require("survival")
Surv.mixord <- mixor( Surv(smkonset, event) ~ SexMale + cc + tv, 
  data = SmokeOnset, id = class, link = "cloglog", nAGQ = 20, 
  IADD = 1)
summary(Surv.mixord)


###################################################
### code chunk number 13: mixor.Rnw:263-266
###################################################
School.mixord <- mixor(Surv(smkonset, event) ~ SexMale + cc + tv, 
  data = SmokeOnset, id = school, link = "cloglog", nAGQ = 20, IADD = 1)
summary(School.mixord)


###################################################
### code chunk number 14: mixor.Rnw:271-275
###################################################
students.mixord <- mixor( Surv(smkonset, event) ~ SexMale + cc + tv, 
  data = SmokeOnset, id = class, link = "cloglog", KG = 1, nAGQ = 20, 
  IADD = 1)
summary(students.mixord)


###################################################
### code chunk number 15: mixor.Rnw:279-282
###################################################
LRtest <- deviance(Surv.mixord) - deviance(students.mixord)
LRtest
pchisq(LRtest, 2, lower.tail=FALSE)


###################################################
### code chunk number 16: mixor.Rnw:285-295
###################################################
cm <- matrix(c(1, 1, 0, 0,
  0, 0, 1, 1,
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,
  1, 0, 0, 0,
  0, 1, 0, 0,
  0, 0, 1, 0,
  0, 0, 0, 1), byrow = TRUE, ncol = 4)
Contrasts(students.mixord, contrast.matrix = cm)


###################################################
### code chunk number 17: mixor.Rnw:303-307
###################################################
data("norcag")
Fitted.norcag <- mixor(SexItems ~ Item2vs1 + Item3vs1, 
  data = norcag, id = ID, weights = freq, link = "logit", nAGQ = 20)
summary(Fitted.norcag)


###################################################
### code chunk number 18: mixor.Rnw:312-316
###################################################
Fitted.norcag.np <- mixor(SexItems ~ Item2vs1 + Item3vs1, 
  data = norcag, id = ID, weights = freq, link = "logit", nAGQ = 10, 
  KG = 2)
summary(Fitted.norcag.np)


###################################################
### code chunk number 19: mixor.Rnw:328-332
###################################################
Fitted.norcag.scale <- mixor(SexItems ~ Item2vs1 + Item3vs1, 
  data = norcag, id = ID, weights = freq, link = "logit", nAGQ = 10, 
  KS = 2)
summary(Fitted.norcag.scale)


###################################################
### code chunk number 20: mixor.Rnw:342-344
###################################################
data("concen")
concen<-concen[order(concen$ID),]


###################################################
### code chunk number 21: mixor.Rnw:347-350
###################################################
Common.ICC <- mixor(TConcen ~ Mz, data = concen, id = ID, 
  weights = freq, link = "probit", nAGQ = 10)
summary(Common.ICC)


###################################################
### code chunk number 22: mixor.Rnw:354-359
###################################################
Varying.ICC <- mixor(TConcen ~ Mz + Dz, data = concen, id = ID, 
  weights = freq, which.random.slope = 1:2, exclude.fixed.effect = 2, 
  link = "probit", nAGQ = 20, random.effect.mean = FALSE, 
  UNID = 1)
summary(Varying.ICC)


###################################################
### code chunk number 23: mixor.Rnw:362-365
###################################################
LRtest <- deviance(Common.ICC) - deviance(Varying.ICC)
LRtest
pchisq(LRtest, 1, lower.tail=FALSE)


