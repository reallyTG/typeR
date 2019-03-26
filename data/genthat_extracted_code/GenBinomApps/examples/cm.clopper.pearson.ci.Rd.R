library(GenBinomApps)


### Name: cm.clopper.pearson.ci
### Title: Clopper-Pearson Confidence Interval for Failures Which are
###   Tackled by Countermeasures
### Aliases: cm.clopper.pearson.ci

### ** Examples

## n=110000 tested devices, 2 failures divided in 2 failure types k1=1, k2=1.
## 2 countermeasures with effectivities p1=0.5, p2=0.8
cm.clopper.pearson.ci(110000,size=c(1,1),cm.effect=c(0.5,0.8))
# Confidence.Interval = upper
# Lower.limit = 0
# Upper.limit = 3.32087e-05
# alpha = 0.1




