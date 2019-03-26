library(acc)


### Name: aeefit
### Title: Fits semiparametric regression models for irregularly observed
###   physical activity data
### Aliases: aeefit
### Keywords: aeefit

### ** Examples

## Not run: 
##D data(NHANES)
##D # Example of analyzing NHANES data 
##D # Example 1: Not adjusted for sampling weights
##D nhanesToFit <- NHANES[ which(NHANES$mvpaMinutes!=0), ]
##D formula <- aee(ID, Day, mvpaMinutes) ~ Age+raceBi+VO2max+Gender
##D fitted1 <- aeefit(formula=formula, data=nhanesToFit) 
##D summary(fitted1)
## End(Not run)



