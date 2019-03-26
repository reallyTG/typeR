library(spa)


### Name: predict.spa
### Title: Inductive Predict Procedure For SPA
### Aliases: predict.spa
### Keywords: classes models methods

### ** Examples

## Use simulated example (two moon) and generate a contour plot of the border
set.seed(100)
dat=spa.sim(type="moon") 

L=which(!is.na(dat$y))
U=which(is.na(dat$y))
Dij=as.matrix(daisy(dat[,-1]))

##Use spa to train with a supervised/transductive kernel smoother
gsup<-spa(dat$y[L],graph=Dij[L,L],control=spa.control(gcv="lGCV"))
gsemi<-spa(dat$y,graph=Dij,control=spa.control(gcv="aGCV"))

##Use predict to define a grid for contour plot
gsize=100
a1<-seq(min(dat$x1),max(dat$x1),length=gsize)
a2<-seq(min(dat$x2),max(dat$x2),length=gsize)

zsup=matrix(0,gsize,gsize)
for(i in 1:gsize){
  val=sqrt(t(sapply(1:gsize,function(j)(dat$x1[L]-a1[i])^2+(dat$x2[L]-a2[j])^2)))
  zsup[i,]=predict(gsup,gnew=val)  ##supervised prediction with k-smoother
}
zsemi=matrix(0,gsize,gsize)
for(i in 1:gsize){
  val=sqrt(t(sapply(1:gsize,function(j)(dat$x1-a1[i])^2+(dat$x2-a2[j])^2)))
  zsemi[i,]=predict(gsemi,gnew=val) ##inductive prediction with transductive rule
}

## Plot results
gr=c(2,4)
plot(0,1,cex=1.5,xlab="x1",ylab="x2",type="n",
     xlim=c(-0.5,6.5),ylim=c(-6.5,3.5))
gr=gray(c(.7,.9))
points(dat$x1,dat$x2,pch=16,col=8,cex=1)
points(dat$x1[L],dat$x2[L],pch=16,col=gr[dat$y[L]+1],cex=2)
points(dat$x1[L],dat$x2[L],pch=1,col=1,cex=2)
contour(a1,a2,zsup, levels=.5,add=TRUE,lty=1,method="edge",drawlabels=FALSE,lwd=2,col=gray(0.6))
contour(a1,a2,zsemi,levels=.5,add=TRUE,lty=1,method="edge",drawlabels=FALSE,lwd=2,col=1)
exp1=expression(hat(Y)*"="*hat(f)(G[X]))
exp2=expression(Y[L]*"="*f(X[L])+epsilon)
legend(4.25,par()$usr[4],c(exp1,exp2),cex=1.24,fill=gray(c(0,0.6)),bg="white")
legend(4.25,par()$usr[4],c(exp1,exp2),cex=1.24,fill=gray(c(0,0.6)))

title(switch(attr(dat,"type"),moon="Two Moon Simulated Data",supervised="Supervised Border Simulated set"))
title("\n\nInductive Prediction with a Transductive Model",cex.main=1.1)
box()




