### R code from vignette source 'dbEmpLikeNorm.Rnw'

###################################################
### code chunk number 1: dbEmpLikeNorm.Rnw:58-67
###################################################

library(dbEmpLikeNorm)
normData1 = rnorm(25)
normData2 = rnorm(40,5,2)
normData3 = rnorm(15,7,1)
Lst = list(normData1, normData2, normData3)

dbELnorm(x=Lst, pvl.Table=FALSE)



###################################################
### code chunk number 2: dbEmpLikeNorm.Rnw:75-78
###################################################

dbELnorm(x=Lst, pvl.Table=TRUE)



###################################################
### code chunk number 3: dbEmpLikeNorm.Rnw:84-89
###################################################

returnCutoffValue(numberOfgroups=4, sample.size=c(15,25,25,30),
                  MC.Method=TRUE,
                  targetalpha=0.05, num.mc=1000)



###################################################
### code chunk number 4: dbEmpLikeNorm.Rnw:94-98
###################################################

returnCutoffValue(numberOfgroups=2, sample.size=20, targetalpha=0.05,
                  MC.Method=TRUE, Table.Method=TRUE, Bayes.Method=TRUE)



