library(uwIntroStats)


### Name: oneSample
### Title: One Sample Inferential Methods
### Aliases: oneSample binomInference.exactLR binomInference.exactTail
###   binomInference.halfP binomInference.jeffreys binomInference.wald
###   binomInference.cwald binomInference.score binomInference.cscore
###   binomInference.agresti KMinference.ident CIptKM CIefrKM CIhwKM
###   qSupBrnMotn qSupBrnBrdg print.uOneSample
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Load required libraries
library(survival)

# Reading in a dataset
mri <- read.table("http://www.emersonstatistics.com/datasets/mri.txt",header=TRUE)

# Creating a Surv object to reflect time to death
mri$ttodth <- Surv(mri$obstime,mri$death)

# Reformatting an integer MMDDYY representation of date to be a Date object
mri$mridate <- as.Date(paste(trunc(mri$mridate/10000),trunc((mri$mridate %% 10000)/100),
mri$mridate %% 100,sep="/"),"%m/%d/%y")

# Inference about the mean LDL: a two sample t test that mean LDL is 135 mg/dl
oneSample ("mean", mri$ldl, null.hypothesis=125)

# Inference about the mean LDL: a one sample t test of a lesser alternative
# that mean LDL is 125 mg/dl
oneSample ("mean", mri$ldl, null.hypothesis=125, test.type="less")

# Inference about the mean LDL: a one sample t test of a greater alternative
# that mean LDL is 125 mg/dl
oneSample ("mean", mri$ldl, null.hypothesis=125, test.type="greater")

# Inference about the geometric mean LDL: a one sample t test of a greater
# alternative that geometric mean LDL is 125 mg/dl
oneSample ("geom", mri$ldl, null.hypothesis=125, test.type="greater")

# Inference about the proportion of subjects with LDL greater than 128: exact binomial
# inference that 50% of subjects have LDL greater than 128 mg/dl
oneSample ("prop", mri$ldl, null.hypothesis=0.5, above=128)
oneSample ("prop",mri$ldl>128, null.hypothesis=0.5)




