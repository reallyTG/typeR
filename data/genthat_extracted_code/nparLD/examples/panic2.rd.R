library(nparLD)


### Name: panic2
### Title: Panic disorder study II
### Aliases: panic2
### Keywords: datasets

### ** Examples

## Analysis using F1-LD-F1 design ##
data(panic2)
attach(panic2)
w.t<-c(1:5)
w.g<-c(1:2)
w.pat<-rbind(c(1:5), c(1:5))
ex.f1f1.2<-f1.ld.f1(y=resp, time=time, group=group, subject=subject, w.pat=w.pat, 
w.t=w.t, w.g=w.g, time.name="Week", group.name="Agoraphobia", description=FALSE)
# F1 LD F1 Model 
# ----------------------- 
# Check that the order of the time and group levels are correct.
# Time level:   0 2 4 6 8 
# Group level:   w wo 
# If the order is not correct, specify the correct order in time.order or 
# group.order.

## Wald-type statistic
ex.f1f1.2$Wald.test

#              	   Statistic df     p-value
#Agoraphobia        8.427367  1 3.696152e-03
#Week             119.793400  4 5.912722e-25
#Agoraphobia:Week  13.493440  4 9.100275e-03

## ANOVA-type statistic
ex.f1f1.2$ANOVA.test

#           	  Statistic       df     p-value
#Agoraphobia       8.427367 1.000000 3.696152e-03
#Week             32.089272 2.693506 7.109822e-19
#Agoraphobia:Week  1.751998 2.693506 1.599706e-01

## ANOVA-type statistic for the whole-plot factor
ex.f1f1.2$ANOVA.test.mod.Box

#            Statistic df1      df2     p-value
#Agoraphobia  8.427367   1 28.62587 0.007044246



