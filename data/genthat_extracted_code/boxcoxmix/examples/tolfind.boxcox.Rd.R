library(boxcoxmix)


### Name: tolfind.boxcox
### Title: Grid search over tol for NPPML estimation of random effect and
###   variance component models
### Aliases: tolfind.boxcox
### Keywords: boxcox tolfind

### ** Examples

# The Pennsylvanian Hospital Stay Data
data(hosp, package = "npmlreg")
test1 <- tolfind.boxcox(duration ~ age , data = hosp, K = 2, lambda = 0, 
           find.in.range = c(0, 2), s = 10,  start = "gq")
# Minimal Disparity: 137.8368 at tol= 2 
# Minimal Disparity with EM converged: 137.8368 at tol= 2

# Effect of Phenylbiguanide on Blood Pressure
## No test: 
data(PBG, package = "nlme")
test2 <- tolfind.boxcox(deltaBP ~ dose , groups = PBG$Rabbit, find.in.range = c(0, 2),
    data = PBG, K = 2, lambda = -1, s = 15,  start = "quantile", plot.opt = 0)
test2$Mintol
# [1] 1.6
test2$MinDisparity
# [1] 449.5876
## End(No test)











