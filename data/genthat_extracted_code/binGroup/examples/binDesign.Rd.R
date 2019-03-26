library(binGroup)


### Name: binDesign
### Title: Sample Size Iteration for One Parameter Binomial Problem
### Aliases: binDesign
### Keywords: htest

### ** Examples


# Find a sample size for which the power to
# reject H0: p >= 0.1 in favor of HA: p < 0.1 is
# at least 0.9 (90 percent) in case that the
# true proportion is 0.04 (i.e. an absolute delta 
# of 0.06 to the threshold proportion p.hyp=0.1)
# The exact one sided Clopper-Pearson CI shall be
# used with default confidence level = 0.95.


sasi<-binDesign( nmax=200, delta=0.06,
 p.hyp=0.1, alternative="less", method="CP", power=0.9)
sasi

#### One can also plot the result:

 plot(sasi)


# For larger sample sizes iteration can be very time consuming.
# Better to use only a smaller range of n then:

sasi<-binDesign( nmax=c(200,300), delta=0.03, p.hyp=0.1,
 alternative="less", method="CP", power=0.9)
sasi





