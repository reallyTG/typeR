library(uwIntroStats)


### Name: lincom
### Title: Tests of Linear Combinations of Regression Coefficients
### Aliases: lincom
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Loading required libraries
library(survival)
library(sandwich)

# Reading in a dataset
mri <- read.table("http://www.emersonstatistics.com/datasets/mri.txt",header=TRUE)
attach(mri)

# Linear regression of LDL on age (with robust SE by default)
testReg <- regress ("mean", ldl~age+stroke)

# Testing coefficient created by .5*age - stroke (the first 1 comes from including the intercept)
testC <- c(1, .5, -1)
lincom(testReg, testC)



