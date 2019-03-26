library(nparLD)


### Name: nparLD
### Title: Nonparametric Tests for Repeated Measures Data in Factorial
###   Designs
### Aliases: nparLD nparLD-package
### Keywords: htest

### ** Examples


## Example with the "Panic disorder study I" data (LD-F1 design) ##
data(panic)
ex.f1.np<-nparLD(resp~time, data=panic, subject="subject", description=FALSE)
# LD F1 Model 
# ----------------------- 
# Check that the order of the time level is correct.
# Time level:   0 2 4 6 8 
# If the order is not correct, specify the correct order in time.order.

ex.f1.np$Wald.test
#     Statistic df    p-value
#time  126.6946  4 1.9822e-26

ex.f1.np$ANOVA.test
#     Statistic       df      p-value
#time  36.93664 2.234135 1.975781e-18

## Example with the "Alpha-amylase study" data (LD-F2 design) ##
data(amylase)
ex.f2.np<-nparLD(resp~time1*time2, data=amylase, subject="subject", description=FALSE)
# LD F2 Model 
# ----------------------- 
# Check that the order of the time1 and time2 levels are correct.
# Time1 level:   M T 
# Time2 level:   8 12 17 21 
# If the order is not correct, specify the correct order in time1.order or 
# time2.order.

ex.f2.np$Wald.test
#             Statistic df      p-value
#time1        0.6761043  1 4.109314e-01
#time2       35.8647640  3 7.997949e-08
#time1:time2 14.3020921  3 2.521503e-03

ex.f2.np$ANOVA.test
#             Statistic       df      p-value
#time1        0.6761043 1.000000 4.109314e-01
#time2       14.2671950 2.858344 5.860479e-09
#time1:time2  5.2242782 2.184249 4.150298e-03

## Example with the "Vitality of treetops" data (F1-LD-F1 design) ##
data(tree)
ex.f1f1.np<-nparLD(resp~time*group, data=tree, subject="subject", 
description=FALSE)
# F1 LD F1 Model 
# ----------------------- 
# Check that the order of the time and group levels are correct.
# Time level:   1 2 3 4 
# Group level:   D2 D0 D1 
# If the order is not correct, specify the correct order in time.order or 
# group.order.

ex.f1f1.np$Wald.test
#           Statistic df      p-value
#group       4.510037  2 1.048716e-01
#time       58.061097  3 1.525356e-12
#group:time 14.819966  6 2.170415e-02

ex.f1f1.np$ANOVA.test
#           Statistic       df      p-value
#group       2.352854 1.968147 9.601181e-02
#time       21.389142 2.729147 8.210954e-13
#group:time  3.113632 5.346834 6.768732e-03

ex.f1f1.np$ANOVA.test.mod.Box
#      Statistic      df1     df2   p-value
#group  2.352854 1.968147 64.3979 0.1040525

## Example with the "Postoperative edema" data (F1-LD-F2 design) ##
data(edema)
ex.f1f2.np<-nparLD(resp~group*time1*time2, data=edema, subject="subject", 
description=FALSE)
# F1 LD F2 Model 
# -----------------------  
# Check that the order of the time1, time2, and group levels are correct.
# Time1 level:   Healthy Operated 
# Time2 level:   -1 1 3 5 
# Group level:   Drug Placebo 
# If the order is not correct, specify the correct order in time1.order, 
# time2.order, or group.order.

ex.f1f2.np$Wald.test
#                   Statistic df      p-value
#group              1.0725762  1 3.003643e-01
#time1             25.8758257  1 3.641005e-07
#time2             36.8857947  3 4.864630e-08
#group:time1        0.3304448  1 5.653973e-01
#time2:time1       47.3460508  3 2.933702e-10
#group:time2        5.3048189  3 1.507900e-01
#group:time1:time2  1.6581652  3 6.462743e-01

ex.f1f2.np$ANOVA.test
#                   Statistic       df      p-value
#group              1.0725762 1.000000 3.003643e-01
#time1             25.8758257 1.000000 3.641005e-07
#time2             11.0630080 2.699667 9.661602e-07
#group:time1        0.3304448 1.000000 5.653973e-01
#time2:time1       15.1854889 2.630202 6.184646e-09
#group:time2        1.3342605 2.699667 2.625538e-01
#group:time1:time2  0.7170325 2.630202 5.242367e-01

## Example with the "Shoulder tip pain study" data (F2-LD-F1 design) ##
data(shoulder)
ex.f2f1.np<-nparLD(resp~time*group1*group2, data=shoulder, subject="subject", 
description=FALSE)
# F2 LD F1 Model 
# ----------------------- 
# Check that the order of the time, group1, and group2 levels are correct.
# Time level:   1 2 3 4 5 6 
# Group1 level:   Y N 
# Group2 level:   F M 
# If the order is not correct, specify the correct order in time.order, 
# group1.order, or group2.order.
#
#
# Warning(s):
# The covariance matrix is singular. 

ex.f2f1.np$Wald.test
#                     Statistic df      p-value
#group1             16.40129021  1 5.125033e-05
#group2              0.04628558  1 8.296575e-01
#time               16.34274332  5 5.930698e-03
#group1:group2       0.03583558  1 8.498554e-01
#group1:time        27.51450085  5 4.527996e-05
#group2:time        12.37903186  5 2.994753e-02
#group1:group2:time  5.11864769  5 4.015727e-01

ex.f2f1.np$ANOVA.test
#                     Statistic       df      p-value
#group1             16.40129021 1.000000 5.125033e-05
#group2              0.04628558 1.000000 8.296575e-01
#time                3.38218704 2.700754 2.120366e-02
#group1:group2       0.03583558 1.000000 8.498554e-01
#group1:time         3.71077200 2.700754 1.398190e-02
#group2:time         1.14434841 2.700754 3.272967e-01
#group1:group2:time  0.43755394 2.700754 7.054255e-01

ex.f2f1.np$ANOVA.test.mod.Box
#                Statistic df1      df2      p-value
#group1        16.40129021   1 21.86453 0.0005395379
#group2         0.04628558   1 21.86453 0.8316516274
#group1:group2  0.03583558   1 21.86453 0.8516017168



