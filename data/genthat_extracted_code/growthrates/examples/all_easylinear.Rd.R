library(growthrates)


### Name: all_easylinear
### Title: Easy Growth Rates Fit to data Frame
### Aliases: all_easylinear all_easylinear.formula
###   all_easylinear.data.frame

### ** Examples


## No test: 
library("growthrates")
L <- all_easylinear(value ~ time | strain + conc + replicate, data=bactgrowth)
summary(L)
coef(L)
rsquared(L)

results <- results(L)

library(lattice)
xyplot(mumax ~ conc|strain, data=results)
## End(No test)




