library(nparLD)


### Name: plasma
### Title: Plasma-renin study
### Aliases: plasma
### Keywords: datasets

### ** Examples

## Analysis using F1-LD-F1 design ##
data(plasma)
attach(plasma)
w.t<-c(1:5)
w.g<-c(1:4)
w.pat<-rbind(c(1:5), c(1:5), c(1:5), c(1:5))
ex.f1f1.3<-f1.ld.f1(y=resp, time=time, group=group, subject=subject, 
w.pat=w.pat, w.t=w.t, w.g=w.g, time.name="Hour", group.name="Drug", 
description=FALSE)
# F1 LD F1 Model 
# ----------------------- 
# Check that the order of the time and group levels are correct.
# Time level:   0 2 6 8 12 
# Group level:   Propanolol Dobutamine Fenoterol Placebo 
# If the order is not correct, specify the correct order in time.order or 
# group.order.

## Wald-type statistic
ex.f1f1.3$Wald.test

#          Statistic df      p-value
#Drug       128.6257  3 1.069606e-27
#Hour       235.4921  4 8.672886e-50
#Drug:Hour  163.9275 12 8.307977e-29

## ANOVA-type statistic
ex.f1f1.3$ANOVA.test

#          Statistic       df      p-value
#Drug       23.74689 2.610248 1.113276e-13
#Hour       53.66771 3.108207 7.870535e-36
#Drug:Hour  16.03977 7.778431 2.488143e-23

## ANOVA-type statistic for the whole-plot factor
ex.f1f1.3$ANOVA.test.mod.Box

#     Statistic      df1      df2      p-value
#Drug  23.74689 2.610248 38.76767 2.207969e-08



