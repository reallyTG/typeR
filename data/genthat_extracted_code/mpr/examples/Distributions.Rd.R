library(mpr)


### Name: Distributions
### Title: Distributions in the 'mpr' Package
### Aliases: Distributions distributions Distribution distribution mprdists
###   family Weibull WeibullAFT Gompertz Loglogistic TDL Burr PGW

### ** Examples

# Veterans' administration lung cancer data
data(veteran, package="survival")
head(veteran)

# Weibull MPR treatment model
mpr(Surv(time, status) ~ list(~ trt, ~ trt), data=veteran, family="Weibull")

# Burr MPR treatment model
mpr(Surv(time, status) ~ list(~ trt, ~ trt, ~ trt), data=veteran,
    family="Burr")




