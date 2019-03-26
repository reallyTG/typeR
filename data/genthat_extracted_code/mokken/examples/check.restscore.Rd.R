library(mokken)


### Name: check.restscore
### Title: Check of Nonintersection Using Method Restscore
### Aliases: check.restscore
### Keywords: restscore

### ** Examples

data(acl)
Communality <- acl[,1:10]
restscore.list <- check.restscore(Communality)
plot(restscore.list)
summary(restscore.list)



