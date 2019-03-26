library(pammtools)


### Name: sim_pexp
### Title: Simulate survival times from the piece-wise exponential
###   distribution
### Aliases: sim_pexp

### ** Examples

library(survival)
library(dplyr)
library(pammtools)

# set number of observations/subjects
n <- 250
# create data set with variables which will affect the hazard rate.
df <- cbind.data.frame(x1 = runif (n, -3, 3), x2 = runif (n, 0, 6)) %>%
 as_tibble()
# the formula which specifies how covariates affet the hazard rate
f0 <- function(t) {
 dgamma(t, 8, 2) *6
}
form <- ~ -3.5 + f0(t) -0.5*x1 + sqrt(x2)
set.seed(24032018)
sim_df <- sim_pexp(form, df, 1:10)
head(sim_df)
plot(survfit(Surv(time, status)~1, data = sim_df ))

# for control, estimate with Cox PH
mod <- coxph(Surv(time, status) ~ x1 + pspline(x2), data=sim_df)
coef(mod)[1]
layout(matrix(1:2, nrow=1))
termplot(mod, se = TRUE)

# and using PAMs
layout(1)
ped <- sim_df %>% as_ped(Surv(time, status)~., max_time=10)
library(mgcv)
pam <- gam(ped_status ~ s(tend) + x1 + s(x2), data=ped, family=poisson, offset=offset)
coef(pam)[2]
plot(pam, page=1)

## Not run: 
##D # Example 2: Functional covariates/cumulative coefficients
##D # function to generate one exposure profile, tz is a vector of time points
##D # at which TDC z was observed
##D rng_z = function(nz) {
##D   as.numeric(arima.sim(n = nz, list(ar = c(.8, -.6))))
##D }
##D # two different exposure times  for two different exposures
##D tz1 <- 1:10
##D tz2 <- -5:5
##D # generate exposures and add to data set
##D df <- df %>%
##D   add_tdc(tz1, rng_z) %>%
##D   add_tdc(tz2, rng_z)
##D df
##D 
##D # define tri-variate function of time, exposure time and exposure z
##D ft <- function(t, tmax) {
##D   -1*cos(t/tmax*pi)
##D }
##D fdnorm <- function(x) (dnorm(x,1.5,2)+1.5*dnorm(x,7.5,1))
##D wpeak2 <- function(lag) 15*dnorm(lag,8,10)
##D wdnorm <- function(lag) 5*(dnorm(lag,4,6)+dnorm(lag,25,4))
##D f_xyz1 <- function(t, tz, z) {
##D   ft(t, tmax=10) * 0.8*fdnorm(z)* wpeak2(t - tz)
##D }
##D f_xyz2 <- function(t, tz, z) {
##D   wdnorm(t-tz) * z
##D }
##D 
##D # define lag-lead window function
##D ll_fun <- function(t, tz) {t >= tz}
##D ll_fun2 <- function(t, tz) {t - 2 >= tz}
##D # simulate data with cumulative effect
##D sim_df <- sim_pexp(
##D   formula = ~ -3.5 + f0(t) -0.5*x1 + sqrt(x2)|
##D      fcumu(t, tz1, z.tz1, f_xyz=f_xyz1, ll_fun=ll_fun) +
##D      fcumu(t, tz2, z.tz2, f_xyz=f_xyz2, ll_fun=ll_fun2),
##D   data = df,
##D   cut = 0:10)
## End(Not run)



