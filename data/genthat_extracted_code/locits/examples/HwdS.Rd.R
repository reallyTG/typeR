library(locits)


### Name: HwdS
### Title: Compute the non-decimated Haar wavelet transform without using
###   periodic boundary conditions.
### Aliases: HwdS
### Keywords: algebra

### ** Examples

#
# Apply Haar transform to Gaussian data
#
HwdS(rnorm(32))
#Class 'wd' : Discrete Wavelet Transform Object:
#       ~~  : List with 8 components with names
#              C D nlevels fl.dbase filter type bc date 
#
#$C and $D are LONG coefficient vectors
#
#Created on : Tue Jul 17 15:14:59 2012 
#Type of decomposition:  station 
#
#summary(.):
#----------
#Levels:  5 
#Length of original:  32 
#Filter was:  Haar wavelet 
#Boundary handling:  periodic 
#Transform type:  station 
#Date:  Tue Jul 17 15:14:59 2012 



