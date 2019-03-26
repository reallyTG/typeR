library(pinbasic)


### Name: pin_est_core
### Title: Optimization in PIN models
### Aliases: pin_est_core

### ** Examples

# Loading simulated data for frequently traded stock

data("BSfrequent")

# Generate several matrices of initial values utilizing all methods implemented

inits_grid <- initial_vals(numbuys = BSfrequent[,"Buys"],
                           numsells = BSfrequent[,"Sells"],
                           method = "Grid")

inits_hac <- initial_vals(numbuys = BSfrequent[,"Buys"],
                          numsells = BSfrequent[,"Sells"],
                          method = "HAC")

inits_hac_ref <- initial_vals(numbuys = BSfrequent[,"Buys"],
                              numsells = BSfrequent[,"Sells"],
                              method = "HAC_Ref")

# Optimization with different matrices of initial values

pin_core_grid <- pin_est_core(numbuys = BSfrequent[,"Buys"],
                              numsells = BSfrequent[,"Sells"],
                              factorization = "Lin_Ke", init_vals = inits_grid,
                              lower = rep(0,5), upper = c(1,1, rep(Inf,3)),
                              num_best_res = 5)

pin_core_hac <- pin_est_core(numbuys = BSfrequent[,"Buys"],
                             numsells = BSfrequent[,"Sells"],
                             factorization = "Lin_Ke", init_vals = inits_hac,
                             lower = rep(0,5), upper = c(1,1, rep(Inf,3)))

pin_core_hac_ref <- pin_est_core(numbuys = BSfrequent[,"Buys"],
                                 numsells = BSfrequent[,"Sells"],
                                 factorization = "Lin_Ke", init_vals = inits_hac_ref,
                                 lower = rep(0,5), upper = c(1,1, rep(Inf,3)))

## Not run: 
##D pin_core_hac <- pin_est_core(numbuys = BSfrequent[,"Buys"],
##D                              numsells = BSfrequent[,"Sells"],
##D                              factorization = "Lin_Ke", init_vals = inits_hac,
##D                              lower = rep(0,5), upper = c(1,1, rep(Inf,3)),
##D                              confint = TRUE)
## End(Not run)



