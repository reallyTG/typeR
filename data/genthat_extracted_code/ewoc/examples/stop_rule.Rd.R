library(ewoc)


### Name: stop_rule
### Title: Evaluation of the stop rule
### Aliases: stop_rule

### ** Examples

## Not run: 
##D DLT <- 0
##D dose <- 30
##D step_zero <- ewoc_d1classic(DLT ~ dose, type = 'discrete',
##D                            theta = 0.33, alpha = 0.25,
##D                            min_dose = 0, max_dose = 100,
##D                            dose_set = seq(0, 100, 20),
##D                            rho_prior = matrix(1, ncol = 2, nrow = 1),
##D                            mtd_prior = matrix(1, ncol = 2, nrow = 1),
##D                            rounding = "nearest")
##D stop_rule_sim(step_zero)
##D response_sim <- response_d1classic(rho = 0.05, mtd = 20, theta = 0.33,
##D                                   min_dose = 10, max_dose = 50)
##D sim <- ewoc_simulation(step_zero = step_zero,
##D                        n_sim = 1, sample_size = 2,
##D                        alpha_strategy = "increasing",
##D                        response_sim = response_sim,
##D                        stop_rule_sim = stop_rule_sim,
##D                        ncores = 2)
##D stop_rule(sim$dlt_sim)
## End(Not run)

## Not run: 
##D DLT <- 0
##D dose <- 30
##D step_zero <- ewoc_d1classic(DLT ~ dose, type = 'discrete',
##D                            theta = 0.33, alpha = 0.25,
##D                            min_dose = 0, max_dose = 100,
##D                            dose_set = seq(0, 100, 20),
##D                            rho_prior = matrix(1, ncol = 2, nrow = 1),
##D                            mtd_prior = matrix(1, ncol = 2, nrow = 1),
##D                            rounding = "nearest")
##D stop_rule_sim(step_zero)
##D response_sim <- response_d1classic(rho = 0.05, mtd = 20, theta = 0.33,
##D                                   min_dose = 10, max_dose = 50)
##D sim <- ewoc_simulation(step_zero = step_zero,
##D                        n_sim = 2, sample_size = 30,
##D                        alpha_strategy = "increasing",
##D                        response_sim = response_sim,
##D                        stop_rule_sim = stop_rule_sim,
##D                        ncores = 2)
##D stop_rule(sim$dlt_sim)
## End(Not run)




