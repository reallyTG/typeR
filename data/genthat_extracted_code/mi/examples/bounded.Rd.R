library(mi)


### Name: bounded-continuous-class
### Title: Class "bounded-continuous"
### Aliases: bounded-continuous-class bounded-continuous
### Keywords: classes DirectedTowardDevelopeRs

### ** Examples

# STEP 0: GET DATA
data(CHAIN, package = "mi")

# STEP 0.5 CREATE A missing_variable (you never need to actually do this)
lo_bound <- 0
hi_bound <- rep(Inf, nrow(CHAIN))
hi_bound[CHAIN$log_virus == 0] <- 6
log_virus <- missing_variable(ifelse(CHAIN$log_virus == 0, NA, CHAIN$log_virus), 
                              type = "bounded-continuous", lower = lo_bound, upper = hi_bound)

show(log_virus)



