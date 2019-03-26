library(powerlmm)


### Name: transform_to_posttest
### Title: Helper to transform the simulated longitudinal 'data.frame'
### Aliases: transform_to_posttest

### ** Examples


# Compare longitudinal 3-level model to 2-level model
# fit to just the posttest data
#
# Both models are fit to the same dataset during simulation.
p <- study_parameters(n1 = 11,
                      n2 = 20,
                      n3 = 3,
                      icc_pre_subject = 0.5,
                      icc_pre_cluster = 0.1,
                      icc_slope = 0.05,
                      var_ratio = 0.03)

# simulation formulas
# analyze as a posttest only 2-level model
f_pt <- sim_formula("y ~ treatment + (1 | cluster)",
                 test = "treatment",
                 data_transform = transform_to_posttest)

# analyze as 3-level longitudinal
f_lt <- sim_formula("y ~ time*treatment +
                         (1 + time | subject) +
                         (1 + time | cluster)")

f <- sim_formula_compare("posttest" = f_pt,
                         "longitudinal" = f_lt)
## Not run: 
##D res <- simulate(p,
##D                 formula = f,
##D                 nsim = 2000,
##D                 cores = parallel::detectCores(),
##D                 satterthwaite = TRUE)
##D summary(res)
## End(Not run)




