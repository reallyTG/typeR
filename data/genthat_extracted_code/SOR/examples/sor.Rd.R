library(SOR)


### Name: sor
### Title: Sequentially Offsetted Regression
### Aliases: sor SOR SOR-package

### ** Examples

generatedata <- function(beta,alpha,X,ntime,nsubj, betat, betat1)  {
  
  mean.vec <- exp(crossprod(t(X), beta))
  y <- matrix(0,nrow=nsubj, ncol=ntime)
  y[,1] <- rpois(nsubj ,lambda = mean.vec)
  old.mean <- mean.vec
  new.mean <- old.mean*exp(betat + betat1*X[,2])
  for (t in 1:(ntime-1))  {
    lambda.t <- new.mean - alpha*sqrt(old.mean*new.mean)
    theta.t <- alpha*sqrt(new.mean/old.mean)
    I <- rpois(nsubj, lambda = lambda.t)
    W <- rbinom(nsubj, y[,t], theta.t)
    
    y[,t+1] = W + I
    old.mean <- new.mean
    new.mean <- old.mean*exp(betat + betat1*X[,2])
  }
  longform <- c(t(y))
  time <- rep(1:ntime,times=nsubj)
  subject <- rep(c(1:nsubj),each=ntime)
  
  simdata <- data.frame(count = longform, time = time, subject=subject)
  return(simdata)
}
logit <- function(p) log(p)-log(1-p)
expit <- function(x) exp(x)/(1+exp(x))
set.seed(1)

npop <- 10000
beta0 <- -1.4
beta1 <- 0.4
alpha <- 0.9
gam0 <- -3.15
gam1 <- 6.3
nsubj <- 200
ntime <- 8
betat <- -0.1; betat1 <- 0.1
thresh <- 1

x0 <- rep(1, npop)
x1 <- rbinom(npop, 1, 0.5)

Xmat <- cbind(x0, x1)
timevec <- 0:(ntime-1)

testdat <- generatedata(c(beta0, beta1), alpha, Xmat, ntime, npop, betat = betat, betat1 = betat1)
Y <- matrix(testdat$count, nrow=npop, ncol=ntime, byrow=TRUE)
lambdap <- expit(gam0 + gam1*as.numeric(Y[,1]>=thresh))
Z <- rbinom(npop, 1, lambdap)

casesamp <- rep(0, npop)
casesamp[Z==1] <- rbinom(sum(Z), 1, nsubj/(2*sum(Z)))
controlsamp <- rep(0, npop)
controlsamp[Z==0] <- rbinom(sum(1-Z), 1, nsubj/(2*sum(1-Z)))


case <- which(casesamp==1)
control <- which(controlsamp==1)
id <- sort(c(case, control))
nsubj <- length(control) + length(case)
Ysamp <- NULL
lamsamp <- NULL
zsamp <- NULL
x1samp <- NULL
idsamp <- NULL
time <- NULL
obspersubj <- sample(3:ntime, size=nsubj, replace=TRUE)
for(i in 1:nsubj){
  Ysamp <- c(Ysamp, Y[id[i],1:obspersubj[i]])
  zsamp <- c(zsamp, rep(as.numeric(Z[id[i]]), obspersubj[i]))
  x1samp <- c(x1samp, rep(x1[id[i]], obspersubj[i]))
  time <- c(time, 0:(obspersubj[i]-1))
  idsamp <- c(idsamp, rep(i, obspersubj[i]))
}
p1p0 <- sum((1-Z))/sum(Z)

timemax <- pmax(time-2, 0)
y0 <- 1
betas <- c(beta0, beta1, betat, betat1)
init <-  runif(4, betas -0.1, betas + 0.1)

y.formula <- y~x1+time + x1:time
w1 <- z ~ x1+ as.factor(time) +  x1:time + x1:timemax 
w2 <- ~x1 + time + timemax + x1:time + x1:timemax 

DAT.ods <- data.frame("x1"= x1samp, "time" = time,
                      "timemax" = timemax, "z" = zsamp, "y" = Ysamp, "id" = idsamp)

sor(y.formula, w1, w2, id, family="poisson",y0=1,
    support=0:25, pi1.pi0.ratio=p1p0, data=DAT.ods, init.beta=init, CORSTR="ar1")






