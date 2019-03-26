library(nparLD)


### Name: dental
### Title: Dental study
### Aliases: dental
### Keywords: datasets

### ** Examples

## Analysis using LD-F1 design ##
data(dental)
attach(dental)
ex.f1<-ld.f1(y=resp, time=time, subject=subject, w.pat=c(1,2,3,4), 
time.name="Age", description=FALSE, time.order=NULL)
# LD F1 Model 
# ----------------------- 
# Check that the order of the time level is correct.
# Time level:   8 10 12 14 
# If the order is not correct, specify the correct order in time.order.

## Wald-type statistic 
ex.f1$Wald.test
#     Statistic df p-value
#Week  94.47718  3 2.391503e-20

## ANOVA-type statistic
ex.f1$ANOVA.test
#    Statistic       df      p-value
#Age  31.48774 2.700785 1.437729e-18

## The same analysis can be done using the wrapper function "nparLD" ##

ex.f1np<-nparLD(resp~time, data=dental, subject="subject", description=FALSE)
# LD F1 Model 
# ----------------------- 
# Check that the order of the time level is correct.
# Time level:   8 10 12 14 
# If the order is not correct, specify the correct order in time.order.



