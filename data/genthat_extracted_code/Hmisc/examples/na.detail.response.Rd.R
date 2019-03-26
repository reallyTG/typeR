library(Hmisc)


### Name: na.detail.response
### Title: Detailed Response Variable Information
### Aliases: na.detail.response
### Keywords: models regression

### ** Examples

# sex
# [1] m f f m f f m m m m m m m m f f f m f m
# age
# [1] NA 41 23 30 44 22 NA 32 37 34 38 36 36 50 40 43 34 22 42 30
# y
# [1] 0 1 0 0 1 0 1 0 0 1 1 1 0 0 1 1 0 1 0 0
# options(na.detail.response=TRUE, na.action="na.delete", digits=3)
# lrm(y ~ age*sex)
#
# Logistic Regression Model
# 
# lrm(formula = y ~ age * sex)
#
#
# Frequencies of Responses
#   0 1 
#  10 8
#
# Frequencies of Missing Values Due to Each Variable
#  y age sex 
#  0   2   0
#
#
# Statistics on Response by Missing/Non-Missing Status of Predictors
#
#     age=NA age!=NA sex!=NA Any NA  No NA 
#   N    2.0  18.000   20.00    2.0 18.000
# Mean    0.5   0.444    0.45    0.5  0.444
#
# ......
# options(na.action="na.keep")
# describe(y ~ age*sex)
# Statistics on Response by Missing/Non-Missing Status of Predictors
#
#      age=NA age!=NA sex!=NA Any NA  No NA 
#    N    2.0  18.000   20.00    2.0 18.000
# Mean    0.5   0.444    0.45    0.5  0.444
#
# ...
# options(na.fun.response="table")  #built-in function table()
# describe(y ~ age*sex)
#
# Statistics on Response by Missing/Non-Missing Status of Predictors
#
#   age=NA age!=NA sex!=NA Any NA No NA 
# 0      1      10      11      1    10
# 1      1       8       9      1     8
#
# ...



