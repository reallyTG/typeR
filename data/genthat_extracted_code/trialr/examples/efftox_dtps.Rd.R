library(trialr)


### Name: efftox_dtps
### Title: Calculate dose-transition pathways for an EffTox study
### Aliases: efftox_dtps

### ** Examples

# Calculate the paths for the first cohort of 3 in Thall et al 2014 example
dat <- efftox_parameters_demo()
## Not run: 
##D dtps1 <- efftox_dtps(dat = dat, cohort_sizes = c(3), next_dose = 1)
## End(Not run)
# To calculate future paths in a partially-observed trial
dat <- efftox_parameters_demo()
dat$doses = array(c(1,1,1))
dat$eff = array(c(0,0,0))
dat$tox = array(c(1,1,1))
dat$num_patients = 3
## Not run: 
##D dtps2 <- efftox_dtps(dat = dat, cohort_sizes = c(3), next_dose = 1)
## End(Not run)




