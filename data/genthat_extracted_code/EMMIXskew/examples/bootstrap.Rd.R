library(EMMIXskew)


### Name: bootstrap
### Title: Bootstrap
### Aliases: bootstrap bootstrap.noc
### Keywords: cluster datasets

### ** Examples


n1=300;n2=300;n3=400;
nn <-c(n1,n2,n3)
n <- sum(nn)
p <- 2
g <- 3


sigma<-array(0,c(p,p,g))
for(h in 1:3) sigma[,,h]<-diag(p)

mu  <- cbind(c(4,-4),c(3.5,4),c( 0, 0))

# for other distributions, 
#delta <- cbind(c(3,3),c(1,5),c(-3,1))
#dof    <- c(3,5,5)

distr="mvn"
ncov=3

#first we generate a data set
set.seed(111) #random seed is set 
dat <- rdemmix(nn,p,g,distr,mu,sigma,dof=NULL,delta=NULL)

#start from initial partition
clust<- rep(1:g,nn)
obj <- EmSkewfit1(dat,g,clust,distr,ncov,itmax=1000,epsilon=1e-5)

# do bootstrap (stadard error analysis)

## Not run: 
##D std <- bootstrap(dat,n,p,g,distr,ncov,obj,B=19,
##D replace=TRUE,itmax=1000,epsilon=1e-5)
##D print(std)
##D 
##D # do booststrap analysis of -2log(Lambda).
##D 
##D # alternatively data can be input as follow,
##D # dat <- read.table("mydata.txt",header=TRUE)
##D # p   <- ncol(dat)
##D # n   <- nrow(dat)
##D 
##D lad <- bootstrap.noc(dat,n,p,2,4,distr,ncov,B=19,
##D replace=FALSE,itmax=1000,epsilon=1e-5)
##D print(lad)
##D 
##D # return of g=2
##D obj2 <- dget("ReturnOf_g_2.ret")
##D 
##D # return of g=3
##D obj3 <- dget("ReturnOf_g_3.ret")
##D 
##D # return of g=4
##D obj4 <- dget("ReturnOf_g_4.ret")
##D 
##D #The posterior probability matrix for (g=3) is obtained by
##D 
##D tau <- obj3$tau
##D 
##D 
## End(Not run)




