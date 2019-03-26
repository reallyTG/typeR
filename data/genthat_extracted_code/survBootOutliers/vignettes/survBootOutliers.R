### R code from vignette source 'survBootOutliers.Rnw'
### Encoding: ASCII

###################################################
### code chunk number 1: survBootOutliers.Rnw:25-28
###################################################
library(survBootOutliers)
whas100_data <-  get.whas100.dataset()
summary(whas100_data)


###################################################
### code chunk number 2: survBootOutliers.Rnw:36-42
###################################################
whass <- get.whas100.dataset()
outliers_osd <- survBootOutliers( 
    surv.object=survival::Surv(time = whass$times,event = whass$status ),
    covariate.data = whass[,2:5] , sod.method = "osd",
    max.outliers = 10)
print(outliers_osd)


###################################################
### code chunk number 3: survBootOutliers.Rnw:47-55
###################################################
whas <- get.whas100.dataset()
outliers_bht <- survBootOutliers( 
    surv.object=survival::Surv(time = whas$times,event = whas$status ),
    covariate.data = whas[,2:5],
    sod.method = "bht",
    B = 10,
    B.N = 100)
print(outliers_bht)


###################################################
### code chunk number 4: survBootOutliers.Rnw:60-69
###################################################
whas <- get.whas100.dataset()
outliers_dbht <- survBootOutliers( 
    surv.object=Surv(time = whas$times,event = whas$status ),
    covariate.data = whas[,2:5],
    sod.method = "dbht",
    B = 10,
    B.N = 100
)
print(outliers_dbht)


