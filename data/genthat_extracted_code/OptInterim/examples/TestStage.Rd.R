library(OptInterim)


### Name: TestStage
### Title: Statistical test for two-stage or three-stage designs from
###   function OptimDes
### Aliases: TestStage
### Keywords: htest optimize

### ** Examples


## Not run: 
##D ### single arm trial
##D 
##D B.init <- c(1, 2, 3, 4, 5)
##D m.init <- c(15, 20, 25, 20, 15)
##D alpha <- 0.05
##D beta <- 0.1
##D param <- c(1, 1.09, 2, 1.40)
##D x <- 1
##D 
##D # H0: S0=0.40 H1: S1=0.60
##D 
##D shape0 <- param[1]
##D scale0 <- param[2]
##D shape1 <- param[3]
##D scale1 <- param[4]
##D 
##D object1 <- OptimDes(B.init,m.init,alpha,beta,param,x,target="EDA",sf="futility",num.arm=1,num.stage=2)
##D n <- object1$n[2]
##D t1 <- object1$stageTime[1]
##D C1 <- object1$boundary[1]
##D C1U <- object1$boundary[2]
##D C2 <- object1$boundary[3]
##D b <- length(B.init)
##D l <- rank(c(cumsum(m.init),n),ties.method="min")[b+1]
##D mda <- ifelse(l>1,B.init[l-1]+(B.init[l]-B.init[l-1])*(n-sum(m.init[1:(l-1)]))/m.init[l],B.init[l]*(n/m.init[l]))
##D 
##D ### set up values to create a stepwise uniform distribution for accrual
##D B <- B.init[1:l]
##D B[l] <- mda
##D xv <- c(0,B)
##D M <- m.init[1:l]
##D M[l] <- ifelse(l>1,n-sum(m.init[1:(l-1)]),n)
##D yv <- c(0,M/(diff(xv)*n),0)
##D 
##D # density function of accrual 
##D dens.Y <- stepfun(xv,yv,f=1,right=TRUE)
##D # pool of time points to be simulated from
##D t.Y <- seq(0,mda,by=0.01)
##D 
##D # simulate study times of length n
##D sample.Y <- sample(t.Y,n,replace=TRUE,prob=dens.Y(t.Y))
##D 
##D # simulate failure times of length n under the alternative hypothesis
##D sample.T <- rweibull(n,shape=shape1,scale=scale1)
##D 
##D Y1 <- sample.Y[sample.Y<=t1]
##D T1 <- sample.T[sample.Y<=t1]
##D Y2 <- sample.Y[sample.Y>t1]
##D T2 <- sample.T[sample.Y>t1]
##D 
##D # event rate under null hypothesis
##D p0<-pweibull(x,shape=shape0,scale=scale0)
##D 
##D # interim analysis
##D TestStage(x, C1, C1U, C2, tan=t1,num.arm=1,num.stage=2,Y11=Y1, T11=T1, p0=p0)
##D 
##D # final analysis if the study continues
##D TestStage(x, C1, C1U, C2, tan=t1,num.arm=1,num.stage=2,Y11=Y1, T11=T1, p0=p0)
##D 
##D # simulate failure times of length n under the null hypothesis
##D sample.T <- rweibull(n,shape=shape0,scale=scale0)
##D 
##D Y1 <- sample.Y[sample.Y<=t1]
##D T1 <- sample.T[sample.Y<=t1]
##D Y2 <- sample.Y[sample.Y>t1]
##D T2 <- sample.T[sample.Y>t1]
##D 
##D # interim analysis
##D TestStage(x, C1, C1U, C2, tan=t1,num.arm=1,num.stage=2,Y11=Y1, T11=T1, p0=p0)
##D 
##D # final analysis if the study continues
##D TestStage(x, C1, C1U, C2, tan=mda+x,num.arm=1,num.stage=2,Y11=Y1, T11=T1, p0=p0,Y21=Y2,T21=T2)
##D 
## End(Not run)



