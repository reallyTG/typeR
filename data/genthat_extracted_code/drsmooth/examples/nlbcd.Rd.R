library(drsmooth)


### Name: nlbcd
### Title: Non-linearity Below Cut-off Dose
### Aliases: nlbcd

### ** Examples

# Prints the F test of the difference between the spline model (output "Model 2")
# and the linear model (output "Model 1") as a test of nonlinearity
# for doses below 1.5 (i.e., all dose levels up to and including 1.49):
nlbcd("dose", "MF_Log", cutoffdose=1.5, data=DRdata)

# This produces an error, as no cutoffdose was specified:
## Not run: 
##D nlbcd("dose", "MF_Log", data=DRdata)
## End(Not run)



