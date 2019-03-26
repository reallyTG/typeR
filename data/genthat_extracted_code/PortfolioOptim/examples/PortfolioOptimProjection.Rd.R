library(PortfolioOptim)


### Name: PortfolioOptimProjection
### Title: Portfolio optimization which finds an optimal portfolio with the
###   smallest distance to a benchmark.
### Aliases: PortfolioOptimProjection

### ** Examples


library(mvtnorm)
k = 3 
num =100
dat <-  cbind(rmvnorm (n=num, mean = rep(0,k), sigma=diag(k)), matrix(1/num,num,1)) 
# a data sample with num rows and (k+1) columns for k assets;  
w_m <- rep(1/k,k) # benchmark portfolio, a vector of length k, 
port_ret = 0.05 # portfolio target return
alpha_optim = 0.95

# minimal constraints set: \sum theta_i = 1
# has to be in two inequalities: 1 - \epsilon <= \sum theta_i <= 1 +\epsilon
a0 <- rep(1,k)
Aconstr <- rbind(a0,-a0)
bconstr <- c(1+1e-8, -1+1e-8)

LB <- rep(0,k) 
UB <- rep(1,k)  

res <- PortfolioOptimProjection(dat, port_ret, risk="MAD",  
alpha=alpha_optim, w_m, Aconstr, bconstr, LB, UB, maxiter=200, tol=1e-7)

cat ( c("Projection optimal portfolio:\n\n"))
cat(c("weights \n"))
print(res$theta)


cat (c ("\n mean = ", res$mu, " risk  = ", res$risk,    "\n CVaR = ", res$CVaR, " VaR = ",
res$VaR, "\n MAD = ", res$MAD,  "\n\n"))





