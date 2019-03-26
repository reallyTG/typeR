library(bivarRIpower)


### Name: bivarcalcn
### Title: Function to calculate necessary sample size to achieve given
###   power for correlation parameters in bivariate linear regression model
### Aliases: bivarcalcn

### ** Examples

# Example: Calculate necessary sample size to achieve 80 percent power at 5 
# percent alpha level for null and alternative hypotheses that correlation 
# between RI is 0 and .2, respectively, across 6 time points.  Other 
# covariance parameter are set as follows: Correlation between residuals = 0;
# Standard deviations: 1st RI = 1, 2nd RI = 2, 1st residual = .5, 
# 2nd residual = .75  
library(bivarRIpower)
bivarcalcn(power=.80,powerfor='RI',timepts=6,d1=1,d2=2,p=0,p1=.2,s1=.5,s2=.75,
r=0,r1=.1)




