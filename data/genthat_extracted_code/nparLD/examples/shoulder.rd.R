library(nparLD)


### Name: shoulder
### Title: Shoulder tip pain study
### Aliases: shoulder
### Keywords: datasets

### ** Examples

## Analysis using F2-LD-F1 design ##
data(shoulder)
attach(shoulder)
ex.f2f1<-f2.ld.f1(y=resp, time=time, group1=group1, group2=group2, 
subject=subject, time.name="Time", group1.name="Treatment", 
group2.name="Gender", description=FALSE)
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

## Wald-type statistic 
ex.f2f1$Wald.test

#                        Statistic df      p-value
#Treatment             16.40129021  1 5.125033e-05
#Gender                 0.04628558  1 8.296575e-01
#Time                  16.34274332  5 5.930698e-03
#Treatment:Gender       0.03583558  1 8.498554e-01
#Treatment:Time        27.51450085  5 4.527996e-05
#Gender:Time           12.37903186  5 2.994753e-02
#Treatment:Gender:Time  5.11864769  5 4.015727e-01

## ANOVA-type statistic
ex.f2f1$ANOVA.test

#                        Statistic       df      p-value
#Treatment             16.40129021 1.000000 5.125033e-05
#Gender                 0.04628558 1.000000 8.296575e-01
#Time                   3.38218704 2.700754 2.120366e-02
#Treatment:Gender       0.03583558 1.000000 8.498554e-01
#Treatment:Time         3.71077200 2.700754 1.398190e-02
#Gender:Time            1.14434841 2.700754 3.272967e-01
#Treatment:Gender:Time  0.43755394 2.700754 7.054255e-01

## ANOVA-type statistic for the whole-plot factors and
## their interaction
ex.f2f1$ANOVA.test.mod.Box

#                   Statistic df1      df2      p-value
#Treatment        16.40129021   1 21.86453 0.0005395379
#Gender            0.04628558   1 21.86453 0.8316516274
#Treatment:Gender  0.03583558   1 21.86453 0.8516017168



