library(EMMIXskew)


### Name: EmSkew
### Title: The EM Algorithm and Skew Mixture Models
### Aliases: EmSkew
### Keywords: cluster datasets

### ** Examples

#define the dimension of dataset

n1=300;n2=300;n3=400;
nn<-c(n1,n2,n3)

p  <- 2
ng <- 3

#define the parameters
sigma<-array(0,c(2,2,3))
for(h in 2:3) sigma[,,h]<-diag(2)
sigma[,,1]<-cbind( c(1,0.2),c(0.2,1))
mu     <- cbind(c(4,-4),c(3.5,4),c( 0, 0))

#and other parameters if required for "mvt","msn","mst"
delta  <- cbind(c(3,3),c(1,5),c(-3,1))
dof    <- c(3,5,5)

pro   <- c(0.3,0.3,0.4)

distr="mvn"
ncov=3

# generate a data set

set.seed(111) #random seed is reset 

dat <- rdemmix(nn,p,ng,distr,mu,sigma)



# the following code can be used to get singular data (remarked off)
#	dat[1:300,2]<--4 
#	dat[300+1:300,1]<-2
##	dat[601:1000,1]<-0
##	dat[601:1000,2]<-0



#fit the data using KMEANS to get the initial partitions (10 trials)
obj <- EmSkew(dat,ng,distr,ncov,itmax=1000,epsilon=1e-5,nkmeans=10)


# alternatively, if we define initial values like 
initobj<-list()

initobj$pro  <- pro
initobj$mu   <- mu
initobj$sigma<- sigma


initobj$dof  <- dof
initobj$delta<- delta


# then we can fit the data from initial values
obj <- EmSkew(dat,ng,distr,ncov,init=initobj,itmax=1000,epsilon=1e-5)

# finally, if we know inital partition such as 
clust       <- rep(1:ng,nn)


# then we can fit the data from given initial partition
obj <- EmSkew(dat,ng,distr,ncov,clust=clust,itmax=1000,epsilon=1e-5)

# plot the 2D contours

colnames(dat)<- paste("x",1:p,sep='')

# dev.new()
EmSkew.flow(dat,obj)




