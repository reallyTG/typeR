library(locits)


### Name: hwtos2
### Title: Test of second-order stationarity using wavelets.
### Aliases: hwtos2
### Keywords: ts

### ** Examples

#
# First, test a set of iid Gaussians: should be stationary!
#
hwtos2(rnorm(256))
#  8    7    6    5    4    3  
#Class 'tos' : Stationarity Object :
#       ~~~~  : List with 9 components with names
#              nreject rejpval spvals sTS AllTS AllPVal alpha x xSD 
#
#
#summary(.):
#----------
#There are  186  hypothesis tests altogether
#There were  0  FDR rejects
#No p-values were smaller than the FDR val of:   
#Using Bonferroni rejection p-value is  0.0002688172 
#And there would be  0  rejections.
#
#  NOTE: the summary indicates that nothing was rejected: hence stationary!
#
# Second, example. Concatenated Gaussians with different variances
#
hwtos2(c(rnorm(256), rnorm(256,sd=2)))
#  9    8    7    6    5    4    3  
#Class 'tos' : Stationarity Object :
#       ~~~~  : List with 9 components with names
#              nreject rejpval spvals sTS AllTS AllPVal alpha x xSD 
#
#
#summary(.):
#----------
#There are  441  hypothesis tests altogether
#There were  5  FDR rejects
#The rejection p-value was  3.311237e-06 
#Using Bonferroni rejection p-value is  0.0001133787 
#And there would be  5  rejections.
#Listing FDR rejects... (thanks Y&Y!)
#P: 5 HWTlev:  0  indices on next line...[1] 1
#P: 6 HWTlev:  0  indices on next line...[1] 1
#P: 7 HWTlev:  0  indices on next line...[1] 1
#P: 8 HWTlev:  0  indices on next line...[1] 1
#P: 9 HWTlev:  0  indices on next line...[1] 1
#
# NOTE: This time 5 Haar wavelet coefficients got rejected: hence series
# is not stationary.




