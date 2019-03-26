## ----fig1, fig.height = 4, fig.width = 6, fig.align = "center"-----------
# Parameter of interest
n<-500
set.seed(42)
theta.x<- c(matrix(0,1,400),runif(n-400,2,6))
set.seed(42)
theta.y<- c(matrix(0,1,450),runif(n-450,2,3))
theta<-theta.x-theta.y

#observations
v.x<- rep(1,n)
v.y<- rep(1,n)
set.seed(42)
x<-rnorm(n,theta.x,v.x)
set.seed(84)
y<-rnorm(n,theta.y,v.y)

# SureShrink estimator of theta
library("asus")
u<- x-y
v.u<- v.x+v.y
theta.ss<-sureshrink(u,v.u)$est

plot(1:n,theta,pch=19,ylab ="theta and theta.ss in red")
points(1:n,theta.ss,col="red",pch=19)

# SURE estimate of risk of theta.hat and choice of threshold
out<- sureshrink.mse(u,v.u)
mse.ss<- out$sure.est
t.ss<- out$t

## ----fig2, fig.height = 4, fig.width = 6, fig.align = "center"-----------
# EJS estimator of theta
theta.ejs<- ejs(u,v.u)

plot(1:n,theta,pch=19,ylab ="theta and theta.ejs in green")
points(1:n,theta.ejs,col="green",pch=19)

## ----fig3, fig.height = 4, fig.width = 6, fig.align = "center"-----------
# side information on theta
s<- abs(x+y) 
out<- asus(u,v.u,s)

# ASUS estimator
theta.asus<- out$est

plot(1:n,theta,pch=19,ylab ="theta and theta.asus in cyan")
points(1:n,theta.asus,col="cyan",pch=19)

# SURE estimate of risk of ASUS
mse.asus<-out$mse

# Grouping and thresholding parameters
tau<- out$tau
t.asus<- out$t

# Group sizes
n.asus<- out$size

## ----fig4, fig.height = 4, fig.width = 6, fig.align = "center"-----------

i1<- (s<=tau)
i2<-(s>tau)
idx<-1:n
plot(idx[i1],u[i1],xlab="1:n",ylab="u",col="red",pch=19)#group 1
points(idx[i2],u[i2],col="green",pch=19)#group 2


