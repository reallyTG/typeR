library(DescTools)


### Name: RelRisk
### Title: Relative Risk
### Aliases: RelRisk
### Keywords: multivariate

### ** Examples

mm <- cbind(c(9,20),c(41,29))
mm
 
RelRisk(t(mm), conf.level=0.95)
RelRisk(t(mm), conf.level=0.95, method="wald")
RelRisk(t(mm), conf.level=0.95, method="use.or")



