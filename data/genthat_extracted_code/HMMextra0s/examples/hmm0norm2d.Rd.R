library(HMMextra0s)


### Name: hmm0norm2d
### Title: Parameter Estimation of a bivariate HMM with Extra Zeros
### Aliases: hmm0norm2d
### Keywords: optimize methods

### ** Examples

pie <- c(0.002,0.2,0.4)
gamma <- matrix(c(0.99,0.007,0.003,
                  0.02,0.97,0.01,
                  0.04,0.01,0.95),byrow=TRUE, nrow=3)
mu <- matrix(c(35.03,137.01,
               35.01,137.29,
               35.15,137.39),byrow=TRUE,nrow=3)
sig <- array(NA,dim=c(2,2,3))
sig[,,1] <- matrix(c(0.005, -0.001,
                   -0.001,0.01),byrow=TRUE,nrow=2)
sig[,,2] <- matrix(c(0.0007,-0.0002,
                    -0.0002,0.0006),byrow=TRUE,nrow=2)
sig[,,3] <- matrix(c(0.002,0.0018,
                     0.0018,0.003),byrow=TRUE,nrow=2)
delta <- c(1,0,0)
y <- sim.hmm0norm2d(mu,sig,pie,gamma,delta, nsim=5000)
R <- y$x
Z <- y$z
yn <- hmm0norm2d(R, Z, pie, gamma, mu, sig, delta)
yn

# Setting up initial values when analysing real-world data
## nk is the number of states for the fitted model
### In this example we use nk=3

LL <- -10^200 ## A very small value to compare with
              ## the log likelihood from the model

nk = 3

gamma <- array(NA,dim=c(nk,nk))
mu <- array(NA,dim=c(nk,2))
sig <- array(NA,dim=c(2,2,nk))
pie <- array(NA,dim=c(1,nk))

kk <- 1
N <- 2
while(kk<N)
{
  temp <- matrix(runif(nk*nk,0,1),ncol=nk)
  diag(temp) = diag(temp) + rpois(1,6) * apply(temp, 1, sum)
  temp <- temp * matrix(rep(1/apply(temp, 1, sum), ncol(temp)), ncol=ncol(temp), byrow=FALSE)
  gamma <- temp

  R1min <- min((R[,1])[R[,1]>=1e-6])
  R1max <- max((R[,1])[R[,1]>=1e-6])
  R2min <- min((R[,2])[R[,2]>=1e-6])
  R2max <- max((R[,2])[R[,2]>=1e-6])
  temp <- cbind(runif(nk,R1min,R1max),runif(nk,R2min,R2max))
  temp <- temp[order(temp[,2]),]
  mu <- temp
 
  sdR1 <- sd((R[,1])[R[,1]>=1e-6])
  sdR2 <- sd((R[,2])[R[,2]>=1e-6])
  for (j in 1:nk){
    temp <- matrix(runif(4,0.0001,max(sdR1,sdR2)), ncol=2)
    temp[1,2] <- temp[2,1] <- runif(1,-1,1)* sqrt(prod(diag(temp)))
    sig[, ,j] <- temp
  }

  pie <- matrix(sort(c(runif(1, 0, 0.01),runif(nk-1, 0, 1))), nrow = 1, byrow = TRUE )

  delta <- c(6,runif(nk-1, 0,1)) 
  delta <- delta/sum(delta)

 tryCatch({
    temp <- hmm0norm2d(R, Z, pie, gamma, mu, sig, delta)
    kk<-kk+1
    if( LL <= temp$LL){
      HMMest <- temp
      LL =HMMest$LL
      eval(parse(text=paste('HMM',kk,'est = HMMest',sep="")))
      eval(parse(text=paste('save(HMM',kk,'est, file="HMM',kk,'est.image")',sep='')))
    }
   }, error=function(e){})
 print(kk)
}





