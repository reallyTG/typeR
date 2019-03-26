library(EMMIXskew)


### Name: rdemmix
### Title: Simulate Data Using Mixture Models
### Aliases: rdemmix rdemmix2 rdemmix3
### Keywords: cluster datasets

### ** Examples

#specify the dimension of data, and number of clusters
#the number of observations in each cluster
n1=300;n2=300;n3=400;
nn<-c(n1,n2,n3)

p=2
g=3



#specify the distribution
distr <- "mvn"

#specify mean and covariance matrix for each component

sigma<-array(0,c(2,2,3))
for(h in 2:3) sigma[,,h]<-diag(2)
sigma[,,1]<-cbind( c(1,-0.1),c(-0.1,1))
mu  <- cbind(c(4,-4),c(3.5,4),c( 0, 0))

#reset the random seed 
set.seed(111) 
#generate the dataset
dat <- rdemmix(nn,p,g,distr,    mu,sigma)



# alternatively one can use
pro   <- c(0.3,0.3,0.4)
n=1000
set.seed(111)
dat <- rdemmix2(n,p,g,distr,pro,mu,sigma)
plot(dat)

# and 

set.seed(111)
dobj <- rdemmix3(n,p,g,distr,pro,mu,sigma)
plot(dobj$data)


#other distributions such as "mvt","msn", and "mst".

#t-distributions

dof    <- c(3,5,5)
dat <- rdemmix2(n,p,g,"mvt",pro,mu,sigma,dof)
plot(dat)

#Skew Normal distribution
delta <- cbind(c(3,3),c(1,5),c(-3,1))
dat <- rdemmix2(n,p,g,"msn",pro,mu,sigma,delta=delta)
plot(dat)


#Skew t-distribution
dat <- rdemmix2(n,p,g,"mst",pro,mu,sigma,dof,delta)
plot(dat)






