library(yuima)


### Name: hyavar
### Title: Asymptotic Variance Estimator for the Hayashi-Yoshida estimator
### Aliases: hyavar
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

## Constructing a 95% confidence interval for the quadratic covariation from psample
result <- hyavar(psample)
thetahat <- result$covmat[1,2] # estimate of the quadratic covariation
se <- sqrt(result$avar.cov[1,2]) # estimated standard error
c(lower = thetahat + qnorm(0.025) * se, upper = thetahat + qnorm(0.975) * se)

## True value of the quadratic covariation.
cc.theta <- function(T, sigma1, sigma2, rho) { 
  tmp <- function(t) return(sigma1(t) * sigma2(t) * rho(t)) 
  integrate(tmp, 0, T) 
}

# contained in the constructed confidence interval
cc.theta(T = 1, diff.coef.1, diff.coef.2, cor.rho)$value

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


## The "true" values of the covariance and correlation.
result.full <- cce(yuima)
(cov.true <- result.full$covmat[1,2]) # covariance
(cor.true <- result.full$cormat[1,2]) # correlation

## We use the function poisson.random.sampling to generate nonsynchronous 
## observations by Poisson sampling.
psample<- poisson.random.sampling(yuima, rate = c(0.2,0.3), n = 3000) 

## Constructing 95% confidence intervals for the covariation from psample
result <- hyavar(psample)
cov.est <- result$covmat[1,2] # estimate of covariance
cor.est <- result$cormat[1,2] # estimate of correlation
se.cov <- sqrt(result$avar.cov[1,2]) # estimated standard error of covariance
se.cor <- sqrt(result$avar.cor[1,2]) # estimated standard error of correlation

## 95% confidence interval for covariance
c(lower = cov.est + qnorm(0.025) * se.cov,
 upper = cov.est + qnorm(0.975) * se.cov) # contains cov.true

## 95% confidence interval for correlation
c(lower = cor.est + qnorm(0.025) * se.cor,
 upper = cor.est + qnorm(0.975) * se.cor) # contains cor.true

## We can also use the Fisher z transformation to construct a
## 95% confidence interval for correlation
## It often improves the finite sample behavior of the asymptotic
## theory (cf. Section 4.2.3 of Barndorff-Nielsen and Shephard (2004))
z <- atanh(cor.est) # the Fisher z transformation of the estimated correlation
se.z <- se.cor/(1 - cor.est^2) # standard error for z (calculated by the delta method)
## 95% confidence interval for correlation via the Fisher z transformation
c(lower = tanh(z + qnorm(0.025) * se.z), upper = tanh(z + qnorm(0.975) * se.z)) 




