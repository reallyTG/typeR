library(DISTRIB)


### Name: DISTRIB-package
### Title: Four Essential Functions for Statistical Distributions Analysis:
###   A New Functional Approach
### Aliases: DISTRIB-package DISTRIB
### Keywords: package pdf cdf rd q package stats

### ** Examples

# An applied example for computing p-value in testing H0: mu>=0, vs, H1: mu<0 with two 
# different test statistic distribution: 

# (a) where the statistics test is T~N(0,1) and its observed value is t = -1.5
p_value = cdf(T.dist="norm", T.dist.par=c(0,1), t=-1.5)
print(p_value)

# (b) where the statistics test T has t-student dist. with 10 degree of freedom 
#     and its observed value is t = -1.5
p_value = cdf(T.dist="t", T.dist.par=10, t=-1.5) 
print(p_value)



