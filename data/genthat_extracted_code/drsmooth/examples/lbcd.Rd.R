library(drsmooth)


### Name: lbcd
### Title: Linearity Below Cut-off Dose
### Aliases: lbcd

### ** Examples

# Conducts a linear regression for all doses below 1.5
# (i.e., all dose levels up to and including 1.4929).
# The significance test on the dose coefficient is the test of non-zero linear slope:
lbcd("dose", "MF_Log", cutoffdose=1.5, data=DRdata)

# This produces an error, as no cutoffdose was specified:
## Not run: 
##D lbcd("dose", "MF_Log", data=DRdata)
## End(Not run)



