library(sampSurf)


### Name: downLogs-class
### Title: Class "downLogs"
### Aliases: downLogs-class hist,downLogs-method summary,downLogs-method
### Keywords: classes

### ** Examples

showClass("downLogs")
buff = matrix(c(0,100,0,100), nrow=2, byrow=TRUE,
              dimnames=list(c('x','y'),c('min','max')))
sl = sampleLogs(10, buttDiam = c(10,25), sampleRect = buff)
dls = downLogs(sl)
summary(dls)



