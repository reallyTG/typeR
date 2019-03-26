library(mada)


### Name: mslSROC
### Title: Plot the Moses-Shapiro-Littenberg SROC curve
### Aliases: mslSROC

### ** Examples

## First Example
data(Dementia)
ROCellipse(Dementia)
mslSROC(Dementia, add = TRUE) # Add the MSL-SROC to this plot

## Second Example
# Make a fancy plot and look at the coefficients
msl_Dementia <- mslSROC(Dementia, col = 3, lwd = 3, lty = 3)
msl_Dementia$A2 # intercept on logit SROC space
msl_Dementia$B2 # slope on logit SROC space



