library(Stem)


### Name: Stem.Kriging
### Title: Dynamical spatial mapping
### Aliases: Stem.Kriging
### Keywords: models spatial

### ** Examples

#load the data
data(pm10)

#extract the data
coordinates <- pm10$coords
covariates <- pm10$covariates
z <- pm10$z

#build the parameter list 
#(the phi list is used for the algorithm starting values)
phi <- list(beta=matrix(c(3.65,0.046,-0.904),3,1),
			sigma2eps=0.1,
			sigma2omega=0.2,
			theta=0.01,
			G=matrix(0.77,1,1),
			Sigmaeta=matrix(0.3,1,1),
			m0=as.matrix(0),
			C0=as.matrix(1))

K<-matrix(1,ncol(z),1)

mod1 <- Stem.Model(z=z,covariates=covariates,coordinates=coordinates,phi=phi,K=K)
class(mod1)
is.Stem.Model(mod1)

#mod1 is given as output by the Stem.Model function
mod1.est <- Stem.Estimation(mod1)

#coordinates of the 25 new points displaced in a regular grid (S=25)
xxx  <- seq(400,470,length=5)
yyy <- seq(5000,5070,length=5)
coord.new <- expand.grid(x=xxx,y=yyy)

#plot of the spatial locations
plot(pm10$coords[,1],pm10$coords[,2],xlab=colnames(pm10$coords)[1],
ylab=colnames(pm10$coords)[2])
points(coord.new[,1],coord.new[,2],col=2,pch=19)
legend("topleft",col=c(1,2),lty=c(0,0), pch=c(21,19),
legend=c("Original spatial locations","New spatial locations"))

#the covariates matrix for the new 25 spatial locations for the 10th time point
covariates.new <- cbind(rep(1,25),  
c(37.98348, 18.14824, 15.32287, 11.00458, 6.67696,
29.120820, 10.487590, 2.401088, 26.112971, 1.683525,
19.211907, 31.363448, 3.629172, 10.352472, 48.289624,
7.199692, 3.524810, 25.546621, 19.598600, 10.521586,
0.004736363, 0.365510044, 0.975484255, 25.523642458, 4.671496566),
c(0.227688, 0.173037, 0.139985, 0.116392, 0.102476,
0.278325, 0.256422, 0.168136, 0.129460, 0.121040,
0.722656, 0.238780, 0.202586, 0.166547, 0.154638,
0.733208, 1.467990, 0.380001, 0.251896, 0.240350,
 2.292299 ,2.275844 ,1.382322, 0.300729, 0.208798))

K.new<-matrix(1,25,1)

#dynamical spatial prediction (10th day)
mod1.pred <-Stem.Kriging(StemModel=mod1.est,coord.newlocations=coord.new,
			covariates.newlocations=covariates.new,
K.newlocations<-K.new,time.point=10)

#post-processing: build an image map
image(x=xxx,y=yyy,z=matrix(mod1.pred$data.newlocations$z,
length(xxx),length(yyy)),
xlab=colnames(pm10$coords)[1],ylab=colnames(pm10$coords)[2],
xlim=range(mod1.est$data$coordinates[,1])+5,
ylim=range(mod1.est$data$coordinates[,2]+5))
points(pm10$coords[,1],pm10$coords[,2])
points(coord.new[,1],coord.new[,2],col=2,pch=19)

byline <- min((range(xxx)[2]-range(xxx)[1])/4,(range(yyy)[2]-range(yyy)[1])/4)
abline(v=seq(range(xxx)[1],range(xxx)[2],by=byline),col="grey",lty=2)
abline(h=seq(range(yyy)[1],range(yyy)[2],by=byline),col="grey",lty=2)



