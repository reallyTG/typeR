library(ic.infer)


### Name: ic.infer
### Title: Package for inequality-constrained estimation and testing
### Aliases: ic.infer ic.infer-package
### Keywords: htest models regression multivariate

### ** Examples

## unrestricted linear model for grade point averages
limo <- lm(meanGPA~.-n, weights=n, data=grades)
summary(limo)
## restricted linear model with restrictions that better HSR ranking 
## cannot deteriorate meanGPA
orlimo <- orlm(lm(meanGPA~.-n, weights=n, data=grades), index=2:9, 
       ui=make.mon.ui(grades$HSR))
summary(orlimo, brief=TRUE)



