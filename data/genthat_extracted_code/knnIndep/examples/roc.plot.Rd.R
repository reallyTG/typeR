library(knnIndep)


### Name: roc.plot
### Title: Plot a ROC
### Aliases: roc.plot

### ** Examples

mycor = function(...) cor(...)^2
noises = cbind(lin=c(.1,.5,.8),circ=c(.2,.4,.6))
results.cor= run.tests(mycor,args=list(),types=c(1,7),noises=noises,nsim=100,size=50)
roc.plot(generate.roc(results.cor,pval=FALSE),legend=noises)



