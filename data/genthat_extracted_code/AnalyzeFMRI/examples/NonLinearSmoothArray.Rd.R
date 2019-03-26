library(AnalyzeFMRI)


### Name: NonLinearSmoothArray
### Title: Non-linear spatial smmothing of 3D and 4D arrays.
### Aliases: NonLinearSmoothArray non_lin_gauss_smooth
###   temporal_non_lin_gauss_smooth
### Keywords: utilities

### ** Examples


#3D array
d<-rep(10,3)
a<-array(3,dim=d)
a[,5:10,5:10]<-7
a<-a+array(rnorm(n=1000,sd=1),dim=d)

h<-NonLinearSmoothArray(a,voxdim=c(1,1,1),radius=2,sm=3)

par(mfrow=c(2,2))
image(a[1,,],zlim=c(-1,12));title("Before smoothing")
image(h[1,,],zlim=c(-1,12));title("After smoothing")
persp(a[1,,],zlim=c(-1,12))
persp(h[1,,],zlim=c(-1,12))

#4D array
d<-c(10,10,10,20)
a<-array(1,dim=d)
a[,,6:10,]<-2
a<-a+array(rnorm(20000,sd=.1),dim=d)

h<-NonLinearSmoothArray(a,voxdim=c(1,1,1),radius=2,sm=3)

par(mfrow=c(2,2),mar=c(0,0,0,0))
for(i in 1:10){
    for(j in 10:1){
        plot(a[1,i,j,],type="l",ylim=c(0,3),axes=FALSE);box()
        lines(h[1,i,j,],col=2)
    }}




