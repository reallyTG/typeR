library(ewoc)


### Name: optimal_toxicity
### Title: Percent of doses in relation the optimal toxicity interval
### Aliases: optimal_toxicity

### ** Examples

## Don't show: 
DLT <- 0
dose <- 30
step_zero <- ewoc_d1classic(DLT ~ dose, type = 'discrete',
                           theta = 0.33, alpha = 0.25,
                           min_dose = 0, max_dose = 100,
                           dose_set = seq(0, 100, 20),
                           rho_prior = matrix(1, ncol = 2, nrow = 1),
                           mtd_prior = matrix(1, ncol = 2, nrow = 1),
                           rounding = "nearest")
response_sim <- response_d1classic(rho = 0.05, mtd = 20, theta = 0.33,
                                  min_dose = 10, max_dose = 50)
pdlt_sim <- pdlt_d1classic(rho = 0.05, mtd = 20, theta = 0.33,
                          min_dose = 10, max_dose = 50)
sim <- ewoc_simulation(step_zero = step_zero,
                       n_sim = 1, sample_size = 2,
                       alpha_strategy = "increasing",
                       response_sim = response_sim,
                       ncores = 2)
optimal_toxicity(sim$mtd_sim, theta = 0.33, margin = 0.05, pdlt = pdlt_sim)
optimal_toxicity(sim$dose_sim, theta = 0.33, margin = 0.05, pdlt = pdlt_sim)
## End(Don't show)

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
##D response_sim <- response_d1classic(rho = 0.05, mtd = 20, theta = 0.33,
##D                                   min_dose = 10, max_dose = 50)
##D pdlt_sim <- pdlt_d1classic(rho = 0.05, mtd = 20, theta = 0.33,
##D                           min_dose = 10, max_dose = 50)
##D sim <- ewoc_simulation(step_zero = step_zero,
##D                        n_sim = 2, sample_size = 30,
##D                        alpha_strategy = "increasing",
##D                        response_sim = response_sim,
##D                        ncores = 2)
##D optimal_toxicity(sim$mtd_sim, theta = 0.33, margin = 0.05, pdlt = pdlt_sim)
##D optimal_toxicity(sim$dose_sim, theta = 0.33, margin = 0.05, pdlt = pdlt_sim)
## End(Not run)





