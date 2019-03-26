library(autoFRK)


### Name: autoFRK
### Title: Automatic Fixed Rank Kriging
### Aliases: autoFRK

### ** Examples

#### generating data from two eigenfunctions
set.seed(0)
n=150
s=5
grid1=grid2=seq(0,1,l=30)
grids=expand.grid(grid1,grid2)
fn=matrix(0,900,2)
fn[,1]=cos(sqrt((grids[,1]-0)^2+(grids[,2]-1)^2)*pi)
fn[,2]=cos(sqrt((grids[,1]-0.75)^2+(grids[,2]-0.25)^2)*2*pi)

#### single realization simulation example
w=c(rnorm(1,sd=5),rnorm(1,sd=3))
y=fn%*%w
obs=sample(900,n)
z=y[obs]+rnorm(n)*sqrt(s)
X=grids[obs,]

#### method1: automatic selection and prediction
one.imat=autoFRK(Data=z,loc=X,maxK=15)  
yhat=predict(one.imat,newloc=grids)

#### method2: user-specified basis functions
G=mrts(X,15)
Gpred=predict(G,newx=grids)
one.usr=autoFRK(Data=z,loc=X,G=G)  
yhat2=predict(one.usr,basis=Gpred)

require(fields)
par(mfrow=c(2,2))
image.plot(matrix(y,30,30),main="True")
points(X,cex=0.5, col="grey")
image.plot(matrix(yhat$pred.value,30,30), main="Predicted")
points(X,cex=0.5, col="grey")
image.plot(matrix(yhat2$pred.value,30,30), main="Predicted (method 2)") 
points(X,cex=0.5, col="grey")
plot(yhat$pred.value,yhat2$pred.value, mgp=c(2,0.5,0))

####end of single realization simulation example

#### independent multi-realization simulation example 
set.seed(0)
wt=matrix(0,2,20)
for(tt in 1:20) wt[,tt]=c(rnorm(1,sd=5),rnorm(1,sd=3))
yt=fn%*%wt
obs=sample(900,n)
zt=yt[obs,]+matrix(rnorm(n*20),n,20)*sqrt(s)
X=grids[obs,]
multi.imat=autoFRK(Data=zt,loc=X, maxK=15)  
Gpred=predict(multi.imat$G,newx=grids)

G=multi.imat$G
Mhat=multi.imat$M
dec=eigen(G%*%Mhat%*%t(G))
fhat=Gpred%*%Mhat%*%t(G)%*%dec$vector[,1:2]
par(mfrow=c(2,2))
image.plot(matrix(fn[,1],30,30),main="True Eigenfn 1")
image.plot(matrix(fn[,2],30,30),main="True Eigenfn 2") 
image.plot(matrix(fhat[,1],30,30), main="Estimated Eigenfn 1") 
image.plot(matrix(fhat[,2],30,30), main="Estimated Eigenfn 2") 

#### end of independent multi-realization simulation example




