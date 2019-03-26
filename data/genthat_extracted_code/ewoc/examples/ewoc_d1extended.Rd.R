library(ewoc)


### Name: ewoc_d1extended
### Title: Escalation With Overdose Control
### Aliases: ewoc_d1extended

### ** Examples

DLT <- 0
dose <- 30

test <- ewoc_d1extended(DLT ~ dose, type = 'discrete',
                       theta = 0.33, alpha = 0.25,
                       dose_set = c(30, 40, 50),
                       min_dose = 20, max_dose = 100,
                       rho_prior = matrix(1, ncol = 2, nrow = 2),
                       rounding = "nearest")
summary(test)
plot(test)




