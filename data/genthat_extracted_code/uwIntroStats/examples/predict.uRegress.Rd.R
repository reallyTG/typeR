library(uwIntroStats)


### Name: predict.uRegress
### Title: Prediction Intervals for 'uRegress' objects
### Aliases: predict.uRegress predict
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Loading required libraries
library(survival)
library(sandwich)

# Reading in a dataset
mri <- read.table("http://www.emersonstatistics.com/datasets/mri.txt",header=TRUE)
attach(mri)

# Linear regression of LDL on age (with robust SE by default)
testReg <- regress ("mean", ldl~age)

# 95% Prediction Interval for age 50
predict(testReg)



