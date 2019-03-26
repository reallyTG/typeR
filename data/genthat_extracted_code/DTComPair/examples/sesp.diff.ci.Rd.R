library(DTComPair)


### Name: sesp.diff.ci
### Title: Confidence Intervals for Differences in Sensitivity and
###   Specificity
### Aliases: sesp.diff.ci

### ** Examples

library(DTComPair)
t1 <- read.tab.paired(18, 14, 0, 18,
                      18, 12, 2, 18)
t1
sesp.diff.ci(t1, ci.method="wald", cont.corr=FALSE)
sesp.diff.ci(t1, ci.method="wald", cont.corr=TRUE)
sesp.diff.ci(t1, ci.method="agresti-min")
sesp.diff.ci(t1, ci.method="tango")



