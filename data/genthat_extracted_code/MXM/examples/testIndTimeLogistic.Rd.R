library(MXM)


### Name: Conditional independence test for the static-longitudinal scenario
### Title: Conditional independence test for the static-longitudinal
###   scenario
### Aliases: testIndTimeLogistic testIndTimeMultinom
### Keywords: Binary logistic regression Multinomial logistic regression
###   Ordinal logistic regression Conditional independence test

### ** Examples

## assume these are longitudinal data, each column is a variable (or feature)
x <- matrix( rnorm(400 * 100), ncol = 100 ) 
id <- rep(1:80, each = 5)  ## 80 subjects
reps <- rep( seq(4, 12, by = 2), 80)  ## 5 time points for each subject
dataset <- group.mvbetas(x, id, reps)
## these are the regression coefficients of the first subject's values on the 
## reps (which is assumed to be time in this example)
target <- rbinom(80, 1, 0.5)
testIndTimeLogistic(target, dataset, xIndex = 1 ,csIndex = 0)
testIndTimeLogistic(target, dataset, xIndex = 1 ,csIndex = 2)



