library(fda.usc)


### Name: min.basis
### Title: Select the number of basis using GCV method.
### Aliases: min.basis
### Keywords: nonparametric

### ** Examples



a1<-seq(0,1,by=.01)
a2=rnorm(length(a1),sd=0.2)
f1<-(sin(2*pi*a1))+rnorm(length(a1),sd=0.2)
nc<-50
np<-length(f1)
tt=1:101
S<-S.NW(tt,2)
mdata<-matrix(NA,ncol=np,nrow=50)
for (i in 1:50) mdata[i,]<- (sin(2*pi*a1))+rnorm(length(a1),sd=0.2)
mdata<-fdata(mdata)
nb<-floor(seq(5,29,len=5))
l<-2^(-5:15)
out<-min.basis(mdata,lambda=l,numbasis=nb,type.basis="fourier")
matplot(t(out$gcv),type="l",main="GCV with fourier basis")

# out1<-min.basis(mdata,type.CV = CV.S,lambda=l,numbasis=nb)
# out2<-min.basis(mdata,lambda=l,numbasis=nb)

# variance calculations
y<-mdata
i<-3
z=qnorm(0.025/np)
fdata.est<-out$fdata.est
var.e<-Var.e(mdata,out$S.opt)
var.y<-Var.y(mdata,out$S.opt)
var.y2<-Var.y(mdata,out$S.opt,var.e)

# estimated fdata and point confidence interval
upper.var.e<-out$fdata.est[["data"]][i,]-z*sqrt(diag(var.e))
lower.var.e<-out$fdata.est[["data"]][i,]+z*sqrt(diag(var.e))
dev.new()
plot(y[i,],lwd=1,ylim=c(min(lower.var.e),max(upper.var.e)))
lines(out$fdata.est[["data"]][i,],col=gray(.1),lwd=1)
lines(out$fdata.est[["data"]][i,]+z*sqrt(diag(var.y)),col=gray(0.7),lwd=2)
lines(out$fdata.est[["data"]][i,]-z*sqrt(diag(var.y)),col=gray(0.7),lwd=2)
lines(upper.var.e,col=gray(.3),lwd=2,lty=2)
lines(lower.var.e,col=gray(.3),lwd=2,lty=2)
legend("top",legend=c("Var.y","Var.error"), col = c(gray(0.7),
gray(0.3)),lty=c(1,2))




