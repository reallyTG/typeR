library(nparLD)


### Name: ld.f2
### Title: Nonparametric Tests for the LD-F2 Design
### Aliases: ld.f2
### Keywords: htest

### ** Examples

## Example with the "Alpha-amylase study" data ##
data(amylase)
attach(amylase)
ex.f2<-ld.f2(y=resp, time1=time1, time2=time2, subject=subject,
time1.name="Day", time2.name="Time", description=FALSE, 
time1.order=c("M","T"), time2.order=c(8,12,17,21))
# LD F2 Model 
# ----------------------- 
# Check that the order of the time1 and time2 levels are correct.
# Time1 level:   M T 
# Time2 level:   8 12 17 21 
# If the order is not correct, specify the correct order in time1.order and 
# time2.order.

## Wald-type statistic 
ex.f2$Wald.test

#          Statistic df      p-value
#Day       0.6761043  1 4.109314e-01
#Time     35.8647640  3 7.997949e-08
#Day:Time 14.3020921  3 2.521503e-03

## ANOVA-type statistic
ex.f2$ANOVA.test

#          Statistic       df      p-value
#Day       0.6761043 1.000000 4.109314e-01
#Time     14.2671950 2.858344 5.860479e-09
#Day:Time  5.2242782 2.184249 4.150298e-03



