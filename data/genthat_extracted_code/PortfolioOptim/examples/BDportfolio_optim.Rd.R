library(PortfolioOptim)


### Name: BDportfolio_optim
### Title: Portfolio Optimization by Benders decomposition
### Aliases: BDportfolio_optim

### ** Examples


library (Rsymphony)  
library(Rglpk) 
library(mvtnorm)
k = 3 
num =100
dat <-  cbind(rmvnorm (n=num, mean = rep(0,k), sigma=diag(k)), matrix(1/num,num,1)) 
# a data sample with num rows and (k+1) columns for k assets; 
port_ret = 0.05 # target portfolio return 
alpha_optim = 0.95 

# minimal constraints set: \eqn{\sum \theta_{i} = 1} 
# has to be in two inequalities: \eqn{1 - \epsilon <= \sum \theta_{i} <= 1 + \epsilon} 
a0 <- rep(1,k) 
Aconstr <- rbind(a0,-a0) 
bconstr <- c(1+1e-8, -1+1e-8) 

LB <- rep(0,k) 
UB <- rep(1,k) 

res <- BDportfolio_optim(dat, port_ret, "CVAR", alpha_optim, 
Aconstr, bconstr, LB, UB, maxiter=200, tol=1e-8) 

cat ( c("Benders decomposition portfolio:\n\n")) 
cat(c("weights \n")) 
print(res$theta) 

cat(c("\n mean = ", res$mu, " risk  = ", res$risk, 
"\n CVaR = ", res$CVaR, " VaR = ", res$VaR, "\n MAD = ", res$MAD, "\n\n")) 
 




