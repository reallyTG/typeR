library(ewoc)


### Name: ewoc_simulation
### Title: Generic EWOC simulation
### Aliases: ewoc_simulation

### ** Examples

## Don't show: 
### Classic EWOC
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
sim <- ewoc_simulation(step_zero = step_zero,
                      n_sim = 1, sample_size = 2,
                      alpha_strategy = "increasing",
                      response_sim = response_sim,
                      ncores = 2)

### PH EWOC
time <- 0
status <- 0
dose <- 30

step_zero <- ewoc_d1ph(cbind(time, status) ~ dose, type = 'discrete',
                      theta = 0.33, alpha = 0.25, tau = 10,
                      min_dose = 30, max_dose = 50,
                      dose_set = seq(30, 50, 5),
                      rho_prior = matrix(1, ncol = 2, nrow = 1),
                      mtd_prior = matrix(1, ncol = 2, nrow = 1),
                      distribution = 'exponential',
                      rounding = 'nearest')
response_sim <- response_d1ph(rho = 0.05, mtd = 40, theta = 0.33,
                             min_dose = 30, max_dose = 50,
                             tau = 10, distribution = "exponential")
sim <- ewoc_simulation(step_zero = step_zero,
                      n_sim = 1, sample_size = 2,
                      alpha_strategy = "increasing",
                      response_sim = response_sim,
                      ncores = 2)
## End(Don't show)

## Not run: 
##D ### Classic EWOC
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
##D sim <- ewoc_simulation(step_zero = step_zero,
##D                        n_sim = 2, sample_size = 30,
##D                        alpha_strategy = "increasing",
##D                        response_sim = response_sim,
##D                        ncores = 2)
##D 
##D ### Extended EWOC
##D DLT <- 0
##D dose <- 30
##D step_zero <- ewoc_d1extended(DLT ~ dose, type = 'discrete',
##D                            theta = 0.33, alpha = 0.25,
##D                            min_dose = 0, max_dose = 100,
##D                            dose_set = seq(0, 100, 20),
##D                            rho_prior = matrix(1, ncol = 2, nrow = 2),
##D                            rounding = "nearest")
##D response_sim <- response_d1extended(rho = c(0.05, 0.5),
##D                                    min_dose = 10, max_dose = 50)
##D sim <- ewoc_simulation(step_zero = step_zero,
##D                        n_sim = 2, sample_size = 30,
##D                        alpha_strategy = "increasing",
##D                        response_sim = response_sim,
##D                        ncores = 2)
##D 
##D ### PH EWOC
##D time <- 0
##D status <- 0
##D dose <- 30
##D 
##D step_zero <- ewoc_d1ph(cbind(time, status) ~ dose, type = 'discrete',
##D                       theta = 0.33, alpha = 0.25, tau = 10,
##D                       min_dose = 30, max_dose = 50,
##D                       dose_set = seq(30, 50, 5),
##D                       rho_prior = matrix(1, ncol = 2, nrow = 1),
##D                       mtd_prior = matrix(1, ncol = 2, nrow = 1),
##D                       distribution = 'exponential',
##D                       rounding = 'nearest')
##D response_sim <- response_d1ph(rho = 0.05, mtd = 40, theta = 0.33,
##D                              min_dose = 30, max_dose = 50,
##D                              tau = 10, distribution = "exponential")
##D sim <- ewoc_simulation(step_zero = step_zero,
##D                        n_sim = 2, sample_size = 30,
##D                        alpha_strategy = "increasing",
##D                        response_sim = response_sim,
##D                        ncores = 2)
## End(Not run)




