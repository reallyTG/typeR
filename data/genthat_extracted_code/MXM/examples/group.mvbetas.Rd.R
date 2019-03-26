library(MXM)


### Name: Calculation of the constant and slope for each subject over time
### Title: Calculation of the constant and slope for each subject over time
### Aliases: group.mvbetas

### ** Examples

## assume these are longitudinal data, each column is a variable (or feature)
x <- matrix( rnorm(100 * 100), ncol = 100 ) 
id <- rep(1:20, each = 5)  ## 20 subjects
reps <- rep( seq(4, 12, by = 2), 20)  ## 5 time points for each subject
a <- group.mvbetas(x, id, reps)
dim(a)  ## 5  200
## these are the regression coefficients of the first subject's values on the 
## reps (which is assumed to be time in this example)
a[c(1, 21), 1] 
coef( lm( x[id == 1, 1] ~ reps[1:5] ) )



