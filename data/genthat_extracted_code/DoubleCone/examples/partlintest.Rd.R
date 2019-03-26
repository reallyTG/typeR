library(DoubleCone)


### Name: partlintest
### Title: Tests linear versus partial linear model
### Aliases: partlintest
### Keywords: partial linear test semiparametric

### ** Examples

data(derby)
n=length(derby$speed)
zmat=matrix(0,nrow=n,ncol=2);zvec=1:n*0+1
zmat[derby$cond=="good",1]=1;zvec[derby$cond=="good"]=2
zmat[derby$cond=="fast",2]=1;zvec[derby$cond=="fast"]=3
ans=partlintest(derby$year,derby$speed,zmat,h0=2)
ans$pval
par(mar=c(4,4,1,1));par(mfrow=c(1,2))
plot(derby$year,derby$speed,col=zvec,pch=zvec)
points(derby$year,ans$p0,pch=20,col=zvec)
title("Null fit")
legend(1980,51.6,pch=3:1,col=3:1,legend=c("fast","good","slow"))
plot(derby$year,derby$speed,col=zvec,pch=zvec)
points(derby$year,ans$p1,pch=20,col=zvec)
title("Alternative fit")

data(adhd)
n=length(adhd$sex)
zmat=matrix(0,nrow=n,ncol=2)
zmat[adhd$sex==1,1]=1
zmat[adhd$ethn<5,2]=1
ans=partlintest(adhd$hypb,adhd$fcn,zmat,h0=1)
ans$pval
cols=c("pink3","lightskyblue3")
plot(adhd$hypb,adhd$fcn,col=cols[zmat[,1]+1],pch=zmat[,2]+1,
xlab="Hyperactive behavior level",ylab="Social and Academic Function Score")
cols2=c(2,4)
points(adhd$hypb,ans$p1,col=cols2[zmat[,1]+1],pch=20)




