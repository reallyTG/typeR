library(acc)


### Name: aee
### Title: Creates an aee object
### Aliases: aee
### Keywords: aee

### ** Examples

## Not run: 
##D # We illustrate the use of function aeexfit
##D # with the sample data from the National Health and Nutrition Examination Survey (NHANES) 
##D # to examine the association between the cardiorespiratory function (i.e., VO2max) 
##D # and daily minutes of moderate to vigorous physical activity (MVPA).
##D 
##D data(NHANES)
##D formula <- aee(ID, Day, mvpaMinutes) ~ VO2max
##D # Standard errors are obtained using sandwich estimation
##D fitted <- aeexfit(formula = formula, data = NHANES, se = "Sandwich")
##D summary(fitted)
## End(Not run)



