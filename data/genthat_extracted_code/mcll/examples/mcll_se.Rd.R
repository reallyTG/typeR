library(mcll)


### Name: mcll_se
### Title: Standard error estimation using MCLL
### Aliases: mcll_se
### Keywords: mcll se

### ** Examples

## example 

# data preparation
data(samp) 

# prior function
prior.func <- function(vec.t) {
    sum(dnorm(vec.t, m= c(0,0,0,0, -0.9870405, -0.9870405) ,
                sd=c(100,100,100,100, 1/0.766672, 1/0.766672) , log=TRUE))
}

## parameter estimation
run1 <- system.time(
    result1 <- mcll_est(data=samp, prior.func= prior.func, alp=0.7, 
        method = "BFGS", control= list(maxit=10000) )
)

par <- result1$par # original scale 

## standard error estimation 

# H.prior: analytical solution 
p.var = c(100,100,100,100, 1/0.766672, 1/0.766672)^2
H.prior <- -diag(1/p.var)

# H.prior: numerical solution 
# library(numDeriv)
# H.prior <- hessian(prior.func, par)

# SE estimation (NOT RUN)
#run2 <- system.time(
#    se <- mcll_se(data=samp, par=par, H.prior = H.prior,  alp=0.7, 
#        method= "Nelder-Mead" , control=list(maxit=20000)) 
#)

#se
#       b0        b1        b2        b3      tau0      tau1 
#0.4057844 0.5640063 0.4907643 0.6663096 0.3022842 0.2999727 
 
 



