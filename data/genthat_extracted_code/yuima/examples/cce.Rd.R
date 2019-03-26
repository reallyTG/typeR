library(yuima)


### Name: cce
### Title: Nonsynchronous Cumulative Covariance Estimator
### Aliases: cce
### Keywords: ts

### ** Examples

## Set a model
diff.coef.1 <- function(t, x1 = 0, x2 = 0) sqrt(1+t)
diff.coef.2 <- function(t, x1 = 0, x2 = 0) sqrt(1+t^2)
cor.rho <- function(t, x1 = 0, x2 = 0) sqrt(1/2)
diff.coef.matrix <- matrix(c("diff.coef.1(t,x1,x2)", 
"diff.coef.2(t,x1,x2) * cor.rho(t,x1,x2)", 
"", "diff.coef.2(t,x1,x2) * sqrt(1-cor.rho(t,x1,x2)^2)"), 2, 2) 
cor.mod <- setModel(drift = c("", ""), 
diffusion = diff.coef.matrix,solve.variable = c("x1", "x2")) 

set.seed(111) 

## We use a function poisson.random.sampling to get observation by Poisson sampling.
yuima.samp <- setSampling(Terminal = 1, n = 1200) 
yuima <- setYuima(model = cor.mod, sampling = yuima.samp) 
yuima <- simulate(yuima) 
psample<- poisson.random.sampling(yuima, rate = c(0.2,0.3), n = 1000) 

## cce takes the psample and returns an estimate of the quadratic covariation. 
cce(psample)$covmat[1, 2]
##cce(psample)[1, 2]

## True value of the quadratic covariation.
cc.theta <- function(T, sigma1, sigma2, rho) { 
  tmp <- function(t) return(sigma1(t) * sigma2(t) * rho(t)) 
	integrate(tmp, 0, T) 
}

theta <- cc.theta(T = 1, diff.coef.1, diff.coef.2, cor.rho)$value 
cat(sprintf("theta =%.5f\n", theta))

names(psample@zoo.data)






# Example. A stochastic differential equation with nonlinear feedback. 

## Set a model
drift.coef.1 <- function(x1,x2) x2
drift.coef.2 <- function(x1,x2) -x1
drift.coef.vector <- c("drift.coef.1","drift.coef.2")
diff.coef.1 <- function(t,x1,x2) sqrt(abs(x1))*sqrt(1+t)
diff.coef.2 <- function(t,x1,x2) sqrt(abs(x2))
cor.rho <- function(t,x1,x2) 1/(1+x1^2)
diff.coef.matrix <- matrix(c("diff.coef.1(t,x1,x2)", 
"diff.coef.2(t,x1,x2) * cor.rho(t,x1,x2)","", 
"diff.coef.2(t,x1,x2) * sqrt(1-cor.rho(t,x1,x2)^2)"), 2, 2) 
cor.mod <- setModel(drift = drift.coef.vector,
 diffusion = diff.coef.matrix,solve.variable = c("x1", "x2"))

## Generate a path of the process
set.seed(111) 
yuima.samp <- setSampling(Terminal = 1, n = 10000) 
yuima <- setYuima(model = cor.mod, sampling = yuima.samp) 
yuima <- simulate(yuima, xinit=c(2,3)) 
plot(yuima)


## The "true" value of the quadratic covariation.
cce(yuima)

## We use the function poisson.random.sampling to generate nonsynchronous 
## observations by Poisson sampling.
psample<- poisson.random.sampling(yuima, rate = c(0.2,0.3), n = 3000) 

## cce takes the psample to return an estimated value  of the quadratic covariation. 
## The off-diagonal elements are the value of the Hayashi-Yoshida estimator. 
cce(psample)




# Example. Epps effect for the realized covariance estimator

## Set a model
drift <- c(0,0)

sigma1 <- 1
sigma2 <- 1
rho <- 0.5

diffusion <- matrix(c(sigma1,sigma2*rho,0,sigma2*sqrt(1-rho^2)),2,2)

model <- setModel(drift=drift,diffusion=diffusion,
                  state.variable=c("x1","x2"),solve.variable=c("x1","x2"))
                  
## Generate a path of the latent process
set.seed(116)

## We regard the unit interval as 6.5 hours and generate the path on it 
## with the step size equal to 2 seconds

yuima.samp <- setSampling(Terminal = 1, n = 11700) 
yuima <- setYuima(model = model, sampling = yuima.samp) 
yuima <- simulate(yuima)

## We extract nonsynchronous observations from the path generated above 
## by Poisson random sampling with the average duration equal to 10 seconds

psample <- poisson.random.sampling(yuima, rate = c(1/5,1/5), n = 11700)

## Hayashi-Yoshida estimator consistetly estimates the true correlation
cce(psample)$cormat[1,2]

## If we synchronize the observation data on some regular grid 
## by previous-tick interpolations and compute the correlation 
## by therealized covariance based on such synchronized observations, 
## we underestimate the true correlation (known as the Epps effect). 
## This is illustrated by the following examples.

## Synchronization on the grid with 5 seconds steps
suppressWarnings(s1 <- cce(subsampling(psample, sampling = setSampling(n = 4680)))$cormat[1,2])
s1

## Synchronization on the grid with 10 seconds steps
suppressWarnings(s2 <- cce(subsampling(psample, sampling = setSampling(n = 2340)))$cormat[1,2])
s2

## Synchronization on the grid with 20 seconds steps
suppressWarnings(s3 <- cce(subsampling(psample, sampling = setSampling(n = 1170)))$cormat[1,2])
s3

## Synchronization on the grid with 30 seconds steps
suppressWarnings(s4 <- cce(subsampling(psample, sampling = setSampling(n = 780)))$cormat[1,2])
s4

## Synchronization on the grid with 1 minute steps
suppressWarnings(s5 <- cce(subsampling(psample, sampling = setSampling(n = 390)))$cormat[1,2])
s5

plot(zoo(c(s1,s2,s3,s4,s5),c(5,10,20,30,60)),type="b",xlab="seconds",ylab="correlation",
main = "Epps effect for the realized covariance")



# Example. Non-synchronous and noisy observations of a correlated bivariate Brownian motion

## Generate noisy observations from the model used in the previous example
Omega <- 0.005*matrix(c(1,rho,rho,1),2,2) # covariance matrix of noise
noisy.psample <- noisy.sampling(psample,var.adj=Omega)
plot(noisy.psample)

## Hayashi-Yoshida estimator: inconsistent
cce(noisy.psample)$covmat

## Pre-averaged Hayashi-Yoshida estimator: consistent
cce(noisy.psample,method="PHY")$covmat

## Generalized multiscale estimator: consistent
cce(noisy.psample,method="GME")$covmat

## Multivariate realized kernel: consistent
cce(noisy.psample,method="RK")$covmat

## Nonparametric QMLE: consistent
cce(noisy.psample,method="QMLE")$covmat




