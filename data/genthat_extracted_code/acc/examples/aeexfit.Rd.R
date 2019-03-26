library(acc)


### Name: aeexfit
### Title: Fits semiparametric regression models robust to informative
###   observation times and censoring
### Aliases: aeexfit
### Keywords: aeefit

### ** Examples

## Not run: 
##D 
##D data(NHANES)
##D formula <- aee(ID, Day, mvpaMinutes) ~ VO2max
##D # Standard errors are obtained using sandwich estimation
##D fitted <- aeexfit(formula = formula, data = NHANES, se = "Sandwich")
##D summary(fitted)
## End(Not run)



