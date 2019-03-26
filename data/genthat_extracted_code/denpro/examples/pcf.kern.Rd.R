library(denpro)


### Name: pcf.kern
### Title: Computes a multivariate kernel estimate
### Aliases: pcf.kern
### Keywords: multivariate smooth

### ** Examples

n<-100
dendat<-sim.data(n=n,type="mulmod")

h<-1
pcf<-pcf.kern(dendat,h=h,N=c(32,32))
dp<-draw.pcf(pcf)
contour(dp$x,dp$y,dp$z,drawlabels=FALSE)

d<-2
h<-(4/(d+2))^(1/(d+4))*n^(-1/(d+4))*apply(dendat,2,sd)
pcf<-pcf.kern(dendat,h=h,N=c(32,32))
dp<-draw.pcf(pcf)
contour(dp$x,dp$y,dp$z,drawlabels=FALSE)

# we use now nonuniform weighting of kernels

weights<-matrix(0,n,1)
threshold<-4
for (i in 1:n){
    eta<-(n-i)
    if (eta/h>threshold) result<-0 else result<-exp(-eta^2/(2*h^2))
    weights[i]<-result
}
weights<-weights/sum(weights)

pcf<-pcf.kern(dendat,h=1,N=c(32,32),weights=weights)

dp<-draw.pcf(pcf)
contour(dp$x,dp$y,dp$z,drawlabels=FALSE)




