library(nparLD)


### Name: f1.ld.f1
### Title: Nonparametric Tests for the F1-LD-F1 Design
### Aliases: f1.ld.f1
### Keywords: htest

### ** Examples

## Example with the "Vitality of treetops" data ##
data(tree)
attach(tree)
w.t<-c(1:4)
w.g<-c(1:3)
w.pat <- rbind(c(1:4), c(1:4), c(1:4))
ex.f1f1<-f1.ld.f1(y=resp, time=time, group=group, subject=subject,
w.pat=w.pat, w.t=w.t, w.g=w.g, time.name="Year", group.name="Area",
description=FALSE, time.order=c(1,2,3,4), group.order=c("D0","D1","D2"))
# F1 LD F1 Model 
# ----------------------- 
# Check that the order of the time and group levels are correct.
# Time level:   1 2 3 4 
# Group level:   D0 D1 D2 
# If the order is not correct, specify the correct order in time.order or 
# group.order.

## Wald-type statistic 
ex.f1f1$Wald.test

#          Statistic df      p-value
#Area       4.510037  2 1.048716e-01
#Year      58.061097  3 1.525356e-12
#Area:Year 14.819966  6 2.170415e-02

## ANOVA-type statistic
ex.f1f1$ANOVA.test

#          Statistic       df      p-value
#Area       2.352854 1.968147 9.601181e-02
#Year      21.389142 2.729147 8.210954e-13
#Area:Year  3.113632 5.346834 6.768732e-03

## ANOVA-type statistic for the whole-plot factor
ex.f1f1$ANOVA.test.mod.Box

#     Statistic      df1     df2   p-value
#Area  2.352854 1.968147 64.3979 0.1040525



