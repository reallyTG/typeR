library(ewoc)


### Name: ewoc_d1ph
### Title: Escalation With Overdose Control
### Aliases: ewoc_d1ph

### ** Examples

time <- 9
status <- 0
dose <- 30

test <- ewoc_d1ph(cbind(time, status) ~ dose, type = 'discrete',
                 theta = 0.33, alpha = 0.25, tau = 10,
                 min_dose = 30, max_dose = 50,
                 dose_set = seq(30, 50, 5),
                 rho_prior = matrix(1, ncol = 2, nrow = 1),
                 mtd_prior = matrix(1, ncol = 2, nrow = 1),
                 distribution = 'exponential',
                 rounding = 'nearest')
summary(test)
plot(test)




