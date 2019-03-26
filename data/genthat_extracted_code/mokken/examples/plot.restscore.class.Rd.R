library(mokken)


### Name: plot.restscore.class
### Title: Plot restscore.class objects
### Aliases: plot.restscore.class
### Keywords: plot restscore

### ** Examples

data(acl)
Communality <- acl[,1:10]
restscore.list <- check.restscore(Communality)
plot(restscore.list)
summary(restscore.list)



