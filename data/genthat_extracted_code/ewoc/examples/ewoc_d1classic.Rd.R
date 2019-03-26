library(ewoc)


### Name: ewoc_d1classic
### Title: Escalation With Overdose Control
### Aliases: ewoc_d1classic

### ** Examples

DLT <- 0
dose <- 20
test <- ewoc_d1classic(DLT ~ dose, type = 'discrete',
                      theta = 0.33, alpha = 0.25,
                      min_dose = 0, max_dose = 100,
                      dose_set = seq(0, 100, 20),
                      rho_prior = matrix(1, ncol = 2, nrow = 1),
                      mtd_prior = matrix(1, ncol = 2, nrow = 1),
                      rounding = "nearest")
summary(test)
plot(test)




