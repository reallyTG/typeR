library(gscounts)


### Name: design_nb
### Title: Clinical trials with negative binomial outcomes
### Aliases: design_nb

### ** Examples

# Calculate sample size for given accrual period and study duration assuming uniformal accrual
out <- design_nb(rate1 = 0.0875, rate2 = 0.125, dispersion = 5, power = 0.8,
                 ratio_H0 = 1, sig_level = 0.025,
                 study_period = 4, accrual_period = 1, random_ratio = 2)
out

# Calculate sample size for a fixed exposure time of 0.5 years
out <- design_nb(rate1 = 4.2, rate2 = 8.4, dispersion = 3, power = 0.8,
                 ratio_H0 = 1, sig_level = 0.025,
                 followup_max = 0.5, random_ratio = 2)
out

# Calculate study period for given recruitment time
t_recruit1 <- seq(0, 1.25, length.out = 1200)
t_recruit2 <- seq(0, 1.25, length.out = 800)
out <- design_nb(rate1 = 0.0875, rate2 = 0.125, dispersion = 5, power = 0.8,
                 ratio_H0 = 1, sig_level = 0.025,
                 t_recruit1 = t_recruit1, t_recruit2 = t_recruit2)



