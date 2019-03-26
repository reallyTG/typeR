library(bayesDP)


### Name: bdpnormal
### Title: Bayesian Discount Prior: Gaussian mean values
### Aliases: bdpnormal bdpnormal,ANY-method

### ** Examples

# One-arm trial (OPC) example
fit <- bdpnormal(mu_t  = 30, sigma_t  = 10,  N_t = 50,
                 mu0_t = 32, sigma0_t = 10, N0_t = 50,
                 method = "fixed")
summary(fit)
## Not run: 
##D plot(fit)
## End(Not run)

# Two-arm (RCT) example
fit2 <- bdpnormal(mu_t  = 30, sigma_t  = 10,  N_t = 50,
                  mu0_t = 32, sigma0_t = 10, N0_t = 50,
                  mu_c  = 25, sigma_c  = 10,  N_c = 50,
                  mu0_c = 25, sigma0_c = 10, N0_c = 50,
                  method = "fixed")
summary(fit2)
## Not run: 
##D plot(fit2)
## End(Not run)




