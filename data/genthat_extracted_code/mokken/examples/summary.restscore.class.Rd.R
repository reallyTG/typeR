library(mokken)


### Name: summary.restscore.class
### Title: Summarize restscore.class objects
### Aliases: summary.restscore.class
### Keywords: plot restscore

### ** Examples

data(acl)
Communality <- acl[,1:10]
restscore.list <- check.restscore(Communality)
plot(restscore.list)
summary(restscore.list)



