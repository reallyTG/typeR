library(frontiles)


### Name: ordermscore
### Title: Calculates order-m efficiency score with asymptotic formula
### Aliases: ordermscore
### Keywords: multivariate

### ** Examples

# 1st example
data(spain)
score.orderm<-ordermscore(xobs=as.matrix(spain[,c(2,3,4)]),yobs=as.matrix(spain[,1]))

# 2nd example
data(burposte)
ind.samp<-sample(nrow(burposte),500)
xobs=as.matrix(burposte[ind.samp[1:100],2])
yobs=as.matrix(burposte[ind.samp[1:100],3])
xeval=as.matrix(burposte[ind.samp[101:500],2])
yeval=as.matrix(burposte[ind.samp[101:500],3])
score.orderm.2<-ordermscore(xobs,yobs,xeval,yeval)



