### R code from vignette source 'Mangrove.Rnw'

###################################################
### code chunk number 1: Mangrove.Rnw:33-34
###################################################
library(Mangrove)


###################################################
### code chunk number 2: Mangrove.Rnw:54-57
###################################################
data(exampleORs)
class(exampleORs)
print(exampleORs)


###################################################
### code chunk number 3: Mangrove.Rnw:67-69
###################################################
summary(exampleORs)
plot(exampleORs)


###################################################
### code chunk number 4: Mangrove.Rnw:76-78
###################################################
summary(exampleORs,K=0.02)
plot(exampleORs,K=0.02)


###################################################
### code chunk number 5: Mangrove.Rnw:91-93
###################################################
data(ccped)
class(ccped)


###################################################
### code chunk number 6: Mangrove.Rnw:98-100
###################################################
head(ccped)
summary(ccped)


###################################################
### code chunk number 7: Mangrove.Rnw:108-110
###################################################
ccrisk <- calcORs(ccped,exampleORs)
class(ccrisk)


###################################################
### code chunk number 8: Mangrove.Rnw:119-120
###################################################
plot(ccrisk)


###################################################
### code chunk number 9: Mangrove.Rnw:126-127
###################################################
boxplot(log(ccrisk) ~ ccped[,6])


###################################################
### code chunk number 10: Mangrove.Rnw:132-135
###################################################
ccprob <- applyORs(ccrisk,K=0.02)
summary(ccprob)
boxplot(ccprob ~ ccped[,6])


###################################################
### code chunk number 11: Mangrove.Rnw:141-142
###################################################
selcases <- names(head(sort(ccrisk[ccped[,6] == 2]),1000))


###################################################
### code chunk number 12: Mangrove.Rnw:147-148
###################################################
selcontrols <- names(tail(sort(ccrisk[ccped[,6] == 1]),1000))


###################################################
### code chunk number 13: Mangrove.Rnw:154-155
###################################################
boxplot(list(ctrl=log(ccrisk[selcontrols]),cases=log(ccrisk[selcases])))


###################################################
### code chunk number 14: Mangrove.Rnw:167-170
###################################################
data(exampleBetas)
class(exampleBetas)
summary(exampleBetas)


###################################################
### code chunk number 15: Mangrove.Rnw:175-177
###################################################
data(contped)
class(contped)


###################################################
### code chunk number 16: Mangrove.Rnw:183-186
###################################################
predbetas <- calcBetas(contped,exampleBetas)
contpreds <- applyBetas(predbetas,162,6.4)
summary(contpreds)


###################################################
### code chunk number 17: Mangrove.Rnw:193-194
###################################################
hist(contped[,6] - contpreds)


###################################################
### code chunk number 18: Mangrove.Rnw:204-206
###################################################
data(famped)
summary(famped)


###################################################
### code chunk number 19: Mangrove.Rnw:216-220
###################################################
library(kinship2)
missing <- (apply(famped[,-c(1:6)] == 0,1,sum) == 0)
kinped <- pedigree(famped$ID,famped$Father,famped$Mother,famped$Sex,famped$Phenotype,missid=0)
plot(kinped,col=missing*3 + 1)


###################################################
### code chunk number 20: Mangrove.Rnw:229-230
###################################################
plotNaivePrev(famped,K=0.02)


###################################################
### code chunk number 21: Mangrove.Rnw:236-238
###################################################
p <- 1 - pbinom(2,19,0.02)
print(p)


###################################################
### code chunk number 22: Mangrove.Rnw:250-255
###################################################
tree <- initialiseTree()
class(tree)
tree$addPed(famped,exampleORs)
summary(tree)
print(tree)


###################################################
### code chunk number 23: Mangrove.Rnw:260-262
###################################################
sam <- tree$getPrevs(exampleORs,K=0.02)
class(sam)


###################################################
### code chunk number 24: Mangrove.Rnw:268-269
###################################################
plot(sam)


###################################################
### code chunk number 25: Mangrove.Rnw:275-276
###################################################
summary(sam)


###################################################
### code chunk number 26: Mangrove.Rnw:285-287
###################################################
famrisk <- calcORs(famped,exampleORs)
print(famrisk[famped[,6] == 2])


