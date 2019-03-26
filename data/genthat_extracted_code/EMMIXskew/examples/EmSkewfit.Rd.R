library(EMMIXskew)


### Name: EmSkewfit
### Title: Fit the Multivariate Skew Mixture Models
### Aliases: EmSkewfit EmSkewfit1 EmSkewfit2
### Keywords: cluster datasets

### ** Examples


n1=300;n2=300;n3=400;
nn <-c(n1,n2,n3)
n=1000
p=2
ng=3


sigma<-array(0,c(2,2,3))
for(h in 2:3) sigma[,,h]<-diag(2)
sigma[,,1]<-cbind( c(1,0),c(0,1))
mu  <- cbind(c(4,-4),c(3.5,4),c( 0, 0))

# for other distributions, 
#delta <- cbind(c(3,3),c(1,5),c(-3,1))
#dof    <- c(3,5,5)


pro   <- c(0.3,0.3,0.4)



distr="mvn"
ncov=3

#first we generate a data set
set.seed(111) #random seed is set 
dat <- rdemmix(nn,p,ng,distr,mu,sigma,dof=NULL,delta=NULL)

#start from initial partition
clust<- rep(1:ng,nn)
obj1 <- EmSkewfit1(dat, ng, clust, distr, ncov, itmax=1000, epsilon=1e-4)


#start from initial values
#alternatively, if we define initial values like 

init<-list()

init$pro<-pro
init$mu<-mu
init$sigma<-sigma


# for other distributions, 
#delta <- cbind(c(3,3),c(1,5),c(-3,1))
#dof    <- c(3,5,5)
#init$dof<-dof
#init$delta<-delta

obj2 <-EmSkewfit2(dat, ng, init, distr, ncov,itmax=1000, epsilon=1e-4)



