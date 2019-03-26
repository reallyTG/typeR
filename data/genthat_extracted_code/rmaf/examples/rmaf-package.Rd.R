library(rmaf)


### Name: rmaf-package
### Title: Refined Moving Average Filter Package
### Aliases: rmaf-package rmaf
### Keywords: smooth

### ** Examples

## The first difference of annual global surface air temperatures from 1880 to 1985 with only trend
data(globtemp)
q.n <- qn(globtemp)
fit1 <- ma.filter(globtemp)
fit2 <- ss.filter(globtemp)



