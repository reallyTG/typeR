library(bayesDP)


### Name: bdpbinomial
### Title: Bayesian Discount Prior: Binomial counts
### Aliases: bdpbinomial bdpbinomial,ANY-method

### ** Examples

# One-arm trial (OPC) example
fit <- bdpbinomial(y_t    = 10,
                   N_t    = 500,
                   y0_t   = 25,
                   N0_t   = 250,
                   method = "fixed")
summary(fit)
print(fit)
## Not run: 
##D plot(fit)
## End(Not run)

# Two-arm (RCT) example
fit2 <- bdpbinomial(y_t    = 10,
                    N_t    = 500,
                    y0_t   = 25,
                    N0_t   = 250,
                    y_c    = 8,
                    N_c    = 500,
                    y0_c   = 20,
                    N0_c   = 250,
                    method = "fixed")
summary(fit2)
print(fit2)
## Not run: 
##D plot(fit2)
## End(Not run)




