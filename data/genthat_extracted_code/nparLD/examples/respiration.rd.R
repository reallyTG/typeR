library(nparLD)


### Name: respiration
### Title: Respiratory disorder study
### Aliases: respiration
### Keywords: datasets

### ** Examples

## Analysis using F1-LD-F2 design ##
data(respiration)
attach(respiration)
ex.f2f1<-f2.ld.f1(y=resp, time=time, group1=center, group2=treatment, 
subject=patient, time.name="Time", group1.name="Center", 
group2.name="Treatment", description=FALSE)
# F2 LD F1 Model 
# ----------------------- 
# Check that the order of the time, group1, and group2 levels are correct.
# Time level:   1 2 3 4 5 
# Group1 level:   1 2 
# Group2 level:   A P 
# If the order is not correct, specify the correct order in time.order, 
# group1.order, or group2.order.

## Wald-type statistic 
ex.f2f1$Wald.test

#                       Statistic df     p-value
#Center                10.2569587  1 0.001361700
#Treatment              9.3451482  1 0.002235766
#Time                  17.4568433  4 0.001575205
#Center:Treatment       1.2365618  1 0.266134717
#Center:Time            8.7200395  4 0.068491057
#Treatment:Time        17.5434583  4 0.001515158
#Center:Treatment:Time  0.2898785  4 0.990458142

## ANOVA-type statistic
ex.f2f1$ANOVA.test

#                        Statistic       df      p-value
#Center                10.25695866 1.000000 0.0013616998
#Treatment              9.34514819 1.000000 0.0022357657
#Time                   4.43527016 3.320559 0.0028528788
#Center:Treatment       1.23656176 1.000000 0.2661347165
#Center:Time            1.60699585 3.320559 0.1802120504
#Treatment:Time         5.46185031 3.320559 0.0005867392
#Center:Treatment:Time  0.05915234 3.320559 0.9866660535

## ANOVA-type statistic for the whole-plot factors and 
## their interaction
ex.f2f1$ANOVA.test.mod.Box

#                 Statistic df1      df2     p-value
#Center           10.256959   1 104.9255 0.001803091
#Treatment         9.345148   1 104.9255 0.002836284
#Center:Treatment  1.236562   1 104.9255 0.268676117

## The same analysis can be done using the wrapper function "nparLD" ##

ex.f2f1np<-nparLD(resp~time*center*treatment, data=respiration, 
subject="patient", description=FALSE)
# F2 LD F1 Model 
# ----------------------- 
# Check that the order of the time, group1, and group2 levels are correct.
# Time level:   1 2 3 4 5 
# Group1 level:   1 2 
# Group2 level:   A P 
# If the order is not correct, specify the correct order in time.order, 
# group1.order, or group2.order.



