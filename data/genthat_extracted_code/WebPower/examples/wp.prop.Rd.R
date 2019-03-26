library(WebPower)


### Name: wp.prop
### Title: Statistical Power Analysis for Tests of Proportions
### Aliases: wp.prop

### ** Examples

#To calculate the power for two groups of proportion with unequal sample size:
wp.prop(h=0.52,n1=35,n2=50,alternative="greater",type="2p2n")
#  Power for two-sample proportion (unequal n)
#
#       h n1 n2 alpha     power
#    0.52 35 50  0.05 0.7625743
#
#  NOTE: Sample size for each group
#  URL: http://psychstat.org/prop2p2n

#To calculate the power curve with a sequence of sample sizes:
res <- wp.prop(h=0.52,n1=seq(10,100,10),alternative="greater",type="1p")
res
#  Power for one-sample proportion test
#
#       h   n alpha     power
#    0.52  10  0.05 0.4998128
#    0.52  20  0.05 0.7519557
#    0.52  30  0.05 0.8855706
#    0.52  40  0.05 0.9499031
#    0.52  50  0.05 0.9789283
#    0.52  60  0.05 0.9914150
#    0.52  70  0.05 0.9965928
#    0.52  80  0.05 0.9986772
#    0.52  90  0.05 0.9994960
#    0.52 100  0.05 0.9998111
#
#  URL: http://psychstat.org/prop

#To plot the power curve:
plot(res, type='b')

#To estimate the sample size with a given power:
wp.prop(h=0.52,n1=NULL,power=0.8,alternative="greater",type="1p")
#  Power for one-sample proportion test
#
#       h        n alpha power
#    0.52 22.86449  0.05   0.8
#
#  URL: http://psychstat.org/prop

#To estimate the minimum detectable effect size with a given power:
wp.prop(h=NULL,n1=35,power=0.8,alternative="greater",type="1p")
#  Power for one-sample proportion test
#
#            h  n alpha power
#    0.4202907 35  0.05   0.8
#
#  URL: http://psychstat.org/prop

#To calculate the power curve with a sequence of effect sizes:
wp.prop(h=seq(0.1, 0.8, 0.1),n1=100,alternative="greater",type="1p")
#  Power for one-sample proportion test
#
#      h   n alpha     power
#    0.1 100  0.05 0.2595110
#    0.2 100  0.05 0.6387600
#    0.3 100  0.05 0.9123145
#    0.4 100  0.05 0.9907423
#    0.5 100  0.05 0.9996034
#    0.6 100  0.05 0.9999934
#    0.7 100  0.05 1.0000000
#    0.8 100  0.05 1.0000000
#
#  URL: http://psychstat.org/prop



