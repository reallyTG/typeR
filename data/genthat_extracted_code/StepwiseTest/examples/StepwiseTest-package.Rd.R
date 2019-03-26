library(StepwiseTest)


### Name: StepwiseTest-package
### Title: Multiple Testing Method to Control Generalized Family-Wise Error
###   Rate and False Discovery Proportion
### Aliases: StepwiseTest-package StepwiseTest FWERkControl FDPControl

### ** Examples

# Specify the model parameters
m_null = 3
m_alt  = 7
m = m_null + m_alt
mu = c( rep(0, m_null), rep(0.5,m_alt) )
rho = 0.25
omega= (1-rho)*diag(1,m) + rho*matrix(1,m,m)
v=t(chol(omega))

# generate the data
n = 100
y = mu%*%matrix(1,1,n)+ v %*% matrix(rnorm(m*n),m,n)

# calculate the test statistics and bootstrap statistics
library(foreach)
library(tseries)
B = 100
y_mean = apply(y,1,mean)
y_sig = apply(y,1,sd)
t_stat = as.matrix(sqrt(n)*y_mean/y_sig)
s = tsbootstrap(1:n,B,b=2,type="stationary")
b_stat = foreach(i=1:B,.combine=cbind) %do% {
  y_boot = y[, s[,i]]
  y_mean_boot = apply(y_boot,1,mean)
  sqrt(n)*(y_mean_boot - y_mean)/y_sig
}

# Multiple test that controls FWER(1) at 5% significance level
FWERkControl(t_stat,b_stat,1,0.05)

# Multiple test that controls FWER(3) at 5% significance level
FWERkControl(t_stat,b_stat,1,0.05)

# Multiple test that controls FDP(0.1) at 5% significance level
FDPControl(t_stat,b_stat,0.1,0.05)




