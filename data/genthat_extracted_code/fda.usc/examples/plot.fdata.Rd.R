library(fda.usc)


### Name: plot.fdata
### Title: Plot functional data: fdata.
### Aliases: plot.fdata lines.fdata title.fdata plot.bifd
### Keywords: hplot

### ** Examples

## Not run: 
##D 
##D # example for fdata class of 1 dimension (curve)
##D a1<-seq(0,1,by=.01)
##D a2=rnorm(length(a1),sd=0.2)
##D f1<-(sin(2*pi*a1))+rnorm(length(a1),sd=0.2)
##D nc<-10
##D np<-length(f1)
##D tt=seq(0,1,len=101)
##D mdata<-matrix(NA,ncol=np,nrow=nc)
##D for (i in 1:nc) mdata[i,]<- (sin(2*pi*a1))+rnorm(length(a1),sd=0.2)
##D fdataobj<-fdata(mdata,tt)
##D res=plot.fdata(fdataobj,type="l",col=gray(1:nrow(mdata)/nrow(mdata)))
##D lines(func.mean(fdataobj),col=3,lwd=2) #original curve
##D 
##D # example for fdata2d class of 2 dimension (surface)
##D t1 <- seq(0, 1, length= 51)
##D t2 <- seq(0, 1, length= 31)
##D z<-array(NA,dim=c(4,51,31))
##D for (i in 1:4) z[i,,] <- outer(t1, t2, function(a, b) (i*a)*(b)^i)
##D z.fdata<-fdata(z,list(t1,t2))
##D plot(z.fdata,time=2)
##D plot(z.fdata,mfrow=c(2,2),type="persp",theta=30)
## End(Not run)



