library(uwIntroStats)


### Name: uResiduals
### Title: Extract Residuals from uRegress objects
### Aliases: uResiduals
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Load required libraries
library(survival)

# Reading in a dataset
mri <- read.table("http://www.emersonstatistics.com/datasets/mri.txt",header=TRUE)

# Create a uRegress object, regressing ldl on age
ldlReg <- regress("mean", age~ldl, data=mri)

# Get the studentized residuals
uResiduals(ldlReg, "studentized")

# Get the jackknifed residuals
uResiduals(ldlReg, "jackknife")



