library(knnIndep)


### Name: generate.roc
### Title: Generate ROC curve data
### Aliases: generate.roc

### ** Examples

noises <- cbind(lin=c(.1,.5,.8),circ=c(.2,.4,.6))
mycor <- function(...) cor(...)^2
results.cor <- run.tests(mycor,args=list(),types=c(1,7),noises=noises,nsim=100,size=50)
roc.data <- generate.roc(results.cor,pval=FALSE)
roc.plot(roc.data,legend=noises)



