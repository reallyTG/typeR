library(bshazard)


### Name: summary.bshazard
### Title: Summary of hazard curve
### Aliases: summary.bshazard

### ** Examples

data(lung,package="survival")
 summary(bshazard(Surv(time, status==2) ~ 1,data=lung))
 


