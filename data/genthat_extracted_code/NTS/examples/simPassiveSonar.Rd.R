library(NTS)


### Name: simPassiveSonar
### Title: Simulate A Sample Trajectory
### Aliases: simPassiveSonar

### ** Examples

s2 <- 20 #second sonar location at (s2,0)
q <- c(0.03,0.03)
r <- c(0.02,0.02)
nobs <- 200
start <- c(10,10,0.01,0.01)
H <- c(1,0,1,0,0,1,0,1,0,0,1,0,0,0,0,1)
H <- matrix(H,ncol=4,nrow=4,byrow=TRUE)
W <- c(0.5*q[1], 0,0, 0.5*q[2],q[1],0,0,q[2])
W <- matrix(W,ncol=2,nrow=4,byrow=TRUE)
V <- diag(r)
mu0 <- start
SS0 <- diag(c(1,1,1,1))*0.01
simu_out <- simPassiveSonar(nobs,q,r,start,seed=20)
yy<- simu_out$yy
tt<- 100:200
plot(simu_out$xx[1,tt],simu_out$xx[2,tt],xlab='x',ylab='y')



