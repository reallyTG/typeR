library(brainwaver)


### Name: fitting
### Title: Fitting laws with maximum likelihood
### Aliases: fitting
### Keywords: models

### ** Examples

data(brain)

brain<-as.matrix(brain)

# WARNING : To process only the first five regions
brain<-brain[,1:5]



n.regions<-dim(brain)[2]

#Construction of the correlation matrices for each level of the wavelet decomposition
wave.cor.list<-const.cor.list(brain, method = "modwt" ,wf = "la8", n.levels = 6, 
                               boundary = "periodic", p.corr = 0.975)

#Construction of the adjacency matrices associated to each level of the wavelet decomposition
wave.adj.list<-const.adj.list(wave.cor.list, sup = 0.44, proc.length=dim(brain)[1])

# For scale 4
degree.dist<-rowSums(wave.adj.list[[4]])

par(cex=1.5,cex.lab=1.2,font.lab=2)
hist(degree.dist,xlab="Degree", ylab="Number of regions",main=NULL,col=1,border=8)

nmax<-50
tmp<-hist(degree.dist,breaks=c(0:nmax))
cum.dist<-1-cumsum(tmp$counts)/n.regions 
# cumulative distribution of degree.dist


d<-fitting(degree.dist,nmax)

exp.trace<-exp(-d$mu*(0:nmax))
# cumulative distribution of the exponential law

power.trace<-(1:(nmax+1))^(-d$gamma+1)
# cumulative distribution of the power law

gamma.trace<-1-pgamma((0:nmax),shape=d$alpha,scale=d$beta) 
# cumulative distribution of the truncated power law

par(cex=1.5,cex.lab=1.2,font.lab=2)

plot(log(1:(nmax)),log(cum.dist),pch=3,xlab="log(k)",ylab="log(cumulative distribution)")
lines(log(1:(nmax+1)),log(exp.trace),lty=3,lwd=2)
lines(log(1:(nmax+1)),log(power.trace),lty=2,lwd=2)
lines(log(1:(nmax+1)),log(gamma.trace),lty=1,lwd=2)
#text(c(0.5,0.5,0.5,0.5),c(-3,-3.5,-4,-4.5),labels=c("+ data","-- power law",
#        ".. exponential law","- truncated power law"),pos=4)




