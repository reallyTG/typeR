library(DrImpute)


### Name: getCls
### Title: get base clustering results using SC3 based clustering methods.
### Aliases: getCls

### ** Examples


data(exdata)
exdata <- preprocessSC(exdata)
exdata <- exdata[1:3000, 1:80]
logdat <- log(exdata+1)
cls <- getCls(logdat)




