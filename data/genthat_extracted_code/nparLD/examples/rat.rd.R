library(nparLD)


### Name: rat
### Title: Rat growth study
### Aliases: rat
### Keywords: datasets

### ** Examples

## Analysis using F1-LD-F1 design ##
data(rat)
attach(rat)
w.pat<-matrix(rep(c(1:5),each=5),ncol=5,nrow=5)
ex.f1f1<-f1.ld.f1(y=resp, time=time, group=group, subject=subject, 
time.name="Week", group.name="Treatment", description="FALSE", w.pat=w.pat)
# F1 LD F1 Model 
# ----------------------- 
# Check that the order of the time and group levels are correct.
# Time level:   0 1 2 3 4 
# Group level:   control thyrox thiour 
# If the order is not correct, specify the correct order in time.order or 
# group.order.

## Wald-type statistic 
ex.f1f1$Wald.test

#                Statistic df      p-value
#Treatment        12.52657  2 1.904977e-03
#Week           3619.03739  4 0.000000e+00
#Treatment:Week   70.34311  8 4.199050e-12

## ANOVA-type statistic
ex.f1f1$ANOVA.test

#                 Statistic       df      p-value
#Treatment         5.286582 1.922792 5.654723e-03
#Week           1008.512138 1.990411 0.000000e+00
#Treatment:Week   11.093940 3.516933 3.616929e-08

## ANOVA-type statistic for the whole-plot factor
ex.f1f1$ANOVA.test.mod.Box

#          Statistic      df1      df2    p-value
#Treatment  5.286582 1.922792 19.23468 0.01563658

## The same analysis can be done using the wrapper function "nparLD" ##

ex.f1f1np<-nparLD(resp~time*group, data=rat, subject="subject", 
description=FALSE)
# F1 LD F1 Model 
# ----------------------- 
# Check that the order of the time and group levels are correct.
# Time level:   0 1 2 3 4 
# Group level:   control thyrox thiour 
# If the order is not correct, specify the correct order in time.order or 
# group.order.



