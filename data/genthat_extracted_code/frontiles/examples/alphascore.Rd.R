library(frontiles)


### Name: alphascore
### Title: Calculates alpha-quantile efficiency score
### Aliases: alphascore
### Keywords: robust multivariate

### ** Examples

# 1st example
data(spain)
res.alqf<-alphascore(xobs=as.matrix(spain[,c(2,3,4)]),yobs=as.matrix(spain[,1]),
alpha=0.8)

# 2nd example
data(burposte)
bur.samp<-burposte[which(burposte$xinput<50000),]
ind.samp<-sample(nrow(bur.samp),500)
xeval=as.matrix(bur.samp[ind.samp[1:100],2])
yeval=as.matrix(bur.samp[ind.samp[1:100],3])
xobs=as.matrix(bur.samp[ind.samp[101:500],2])
yobs=as.matrix(bur.samp[ind.samp[101:500],3])

alphafrontier.2d(xobs,yobs,alpha=0.95)
points(xeval,yeval,pch=16,col='red')
text(xeval,yeval,text=as.character(1:100),adj=2,cex=0.8)
score.new.0.95<-alphascore(xobs,yobs,xeval,yeval,alpha=0.95)



