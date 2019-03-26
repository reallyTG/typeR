library(nparLD)


### Name: f1.ld.f2
### Title: Nonparametric Tests for the F1-LD-F2 Design
### Aliases: f1.ld.f2
### Keywords: htest

### ** Examples

## Example with the "Postoperative edema" data ##
data(edema)
attach(edema)
ex.f1f2<-f1.ld.f2(y=resp, time1=time1, time2=time2, group=group, 
subject=subject, time1.name="Hand", time2.name="Day", group.name="Treatment",
description=FALSE, time1.order=c("Healthy","Operated"), time2.order=c(-1,1,3,5), 
group.order=c("Drug","Placebo"))
# F1 LD F2 Model 
# ----------------------- 
# Check that the order of the time1, time2, and group levels are correct.
# Time1 level:   Healthy Operated 
# Time2 level:   -1 1 3 5 
# Group level:   Drug Placebo 
# If the order is not correct, specify the correct order in time1.order, 
# time2.order, or group.order.

## Wald-type statistic 
ex.f1f2$Wald.test

#                    Statistic df      p-value
#Treatment           1.0725762  1 3.003643e-01
#Hand               25.8758257  1 3.641005e-07
#Day                36.8857947  3 4.864630e-08
#Treatment:Hand      0.3304448  1 5.653973e-01
#Day:Hand           47.3460508  3 2.933702e-10
#Treatment:Day       5.3048189  3 1.507900e-01
#Treatment:Hand:Day  1.6581652  3 6.462743e-01

## ANOVA-type statistic
ex.f1f2$ANOVA.test

#                    Statistic       df      p-value
#Treatment           1.0725762 1.000000 3.003643e-01
#Hand               25.8758257 1.000000 3.641005e-07
#Day                11.0630080 2.699667 9.661602e-07
#Treatment:Hand      0.3304448 1.000000 5.653973e-01
#Day:Hand           15.1854889 2.630202 6.184646e-09
#Treatment:Day       1.3342605 2.699667 2.625538e-01
#Treatment:Hand:Day  0.7170325 2.630202 5.242367e-01

## ANOVA-type statistic for the whole-plot factor
ex.f1f2$ANOVA.test.mod.Box

#          Statistic df1      df2   p-value
#Treatment  1.072576   1 55.80551 0.3048313



