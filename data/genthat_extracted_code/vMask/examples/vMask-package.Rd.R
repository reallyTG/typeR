library(vMask)


### Name: vMask-package
### Title: Detect Small Changes in Process Mean using CUSUM Control Chart
###   by v-Mask
### Aliases: vMask-package vMask

### ** Examples



### Example 1:  V-Mask CUSUM chart with vectored data based on the real data from:
#   https://www.itl.nist.gov/div898/handbook/pmc/section3/pmc323.htm

# In this applied example We are going to quickly detect a shift in mean as large as one 
# sigma by CUSUM chart.

Data = c( 324.925, 324.675, 324.725, 324.350, 325.350, 325.225, 
          324.125, 324.525, 325.225, 324.600, 324.625, 325.150, 
          328.325, 327.250, 327.825, 328.500, 326.675, 327.775, 
          326.875, 328.350 )
n = 4
mean(Data)
sd(Data)
sd(Data)/sqrt(n)

vMask.method3( data=Data, mu0=325, k=1, alpha=.0027, beta=.01, s="PressEnter" )



### Example 2:  V-Mask CUSUM chart based on a data matrix.
# A wood products company manufactures charcoal briquettes for barbecues. It packages these 
# briquettes in bags of various sizes, the largest of which is supposed to contain 40 lbs.
# The weights of bags from 16 different samples, each of size n=4 are given in below. 

n = 4
m = 16
mu0 = 40
sigma = .5

Data = c( 40.77, 39.95, 40.86, 39.21,  
          38.94, 39.70, 40.37, 39.88,  
          40.43, 40.27, 40.91, 40.05,  
          39.55, 40.10, 39.39, 40.89,  
          41.01, 39.07, 39.85, 40.32,  
          39.06, 39.90, 39.84, 40.22,  
          39.63, 39.42, 40.04, 39.50,  
          41.05, 40.74, 40.43, 39.40,  
          40.28, 40.89, 39.61, 40.48,  
          39.28, 40.49, 38.88, 40.72,  
          40.57, 40.04, 40.85, 40.51,  
          39.90, 40.67, 40.51, 40.53,  
          40.70, 40.54, 40.73, 40.45,  
          39.58, 40.90, 39.62, 39.83,  
          40.16, 40.69, 40.37, 39.69,  
          40.46, 40.21, 40.09, 40.58 )  

M = matrix(Data, ncol=n, byrow=TRUE)
M

# X.bar Control Chart: 
( LCL = mu0 - 3*sigma/sqrt(n) )
( UCL = mu0 + 3*sigma/sqrt(n) )
plot(1:16,rowMeans(M), col=3, pch=16, ylim=c(LCL-.2,UCL+.2))
abline(h=c(mu0, LCL, UCL), col=2, lty=c(3,1,1))

# Three different strategies for putting v-mask on CUSUM Control Chart:
cumsum(rowMeans(M)-mu0)

vMask.method2( data=M, mu0=40, d=5.6, h=1, s=0 )
vMask.method6( data=M, mu0=40, mu1=40.3, sigma=.5, h=1, w=2, sl="PressEnter" )
vMask.method5( data=M, mu0=40, mu1=40.3, alpha=.1, beta=.01, sl=0 )




