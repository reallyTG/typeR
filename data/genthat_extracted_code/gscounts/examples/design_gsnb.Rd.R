library(gscounts)


### Name: design_gsnb
### Title: Group sequential design with negative binomial outcomes
### Aliases: design_gsnb

### ** Examples

# Calculate the sample sizes for a given accrual period and study period (without futility)
out <- design_gsnb(rate1 = 0.0875, rate2 = 0.125, dispersion = 5, 
                   power = 0.8, timing = c(0.5, 1), esf = obrien,
                   ratio_H0 = 1, sig_level = 0.025,
                   study_period = 3.5, accrual_period = 1.25, random_ratio = 1)
out

# Calculate the sample sizes for a given accrual period and study period with binding futility
out <- design_gsnb(rate1 = 0.0875, rate2 = 0.125, dispersion = 5, 
                   power = 0.8, timing = c(0.5, 1), esf = obrien,
                   ratio_H0 = 1, sig_level = 0.025, study_period = 3.5, 
                   accrual_period = 1.25, random_ratio = 1, futility = "binding", 
                   esf_futility = obrien)
out


# Calculate study period for given recruitment times
expose <- seq(0, 1.25, length.out = 1042)
out <- design_gsnb(rate1 = 0.0875, rate2 = 0.125, dispersion = 5, 
                   power = 0.8, timing = c(0.5, 1), esf = obrien,
                   ratio_H0 = 1, sig_level = 0.025, t_recruit1 = expose, 
                   t_recruit2 = expose, random_ratio = 1)
out

# Calculate sample size for a fixed exposure time
out <- design_gsnb(rate1 = 0.0875, rate2 = 0.125, dispersion = 5, 
                   power = 0.8, timing = c(0.5, 1), esf = obrien,
                   ratio_H0 = 1, sig_level = 0.025,
                   followup_max = 0.5, random_ratio = 1)



