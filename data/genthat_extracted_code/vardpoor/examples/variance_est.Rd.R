library(vardpoor)


### Name: variance_est
### Title: Variance estimation for sample surveys by the ultimate cluster
###   method
### Aliases: variance_est
### Keywords: vardpoor

### ** Examples

Ys <- rchisq(10, 3)
w <- rep(2, 10)
PSU <- 1 : length(Ys)
H <- rep("Strata_1", 10)

# by default without using fh_zero (finite population correction)
variance_est(Y = Ys, H = H, PSU = PSU, w_final = w)


## Not run: 
##D # without using fh_zero (finite population correction)
##D variance_est(Y = Ys, H = H, PSU = PSU, w_final = w, fh_zero = FALSE)
##D 
##D # with using fh_zero (finite population correction)
##D variance_est(Y = Ys, H = H, PSU = PSU, w_final = w, fh_zero = TRUE)
## End(Not run)



