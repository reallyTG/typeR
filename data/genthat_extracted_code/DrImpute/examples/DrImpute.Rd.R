library(DrImpute)


### Name: DrImpute
### Title: Imputing dropout events in single-cell RNA-sequencing data.
### Aliases: DrImpute

### ** Examples


data(exdata)
exdata <- preprocessSC(exdata)
exdata <- exdata[1:3000, 1:80]
logdat <- log(exdata+1)
cls <- getCls(logdat)
logdat_imp <- DrImpute(logdat, cls = cls)




