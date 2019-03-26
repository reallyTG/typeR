library(PowerTOST)


### Name: sampleN.noninf
### Title: Sample size for the non-inferiority t-test
### Aliases: sampleN.noninf

### ** Examples

# using all the defaults: margin=0.8, theta0=0.95, alpha=0.025
# log-transformed, design="2x2"
sampleN.noninf(CV=0.3)
# should give n=48
#
# 'non-superiority' case, log-transformed data
# with assumed 'true' ratio somewhat above 1
sampleN.noninf(CV=0.3, targetpower=0.9, margin=1.25, theta0=1.05)
# should give n=62



