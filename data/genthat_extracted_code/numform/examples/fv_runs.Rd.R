library(numform)


### Name: fv_runs
### Title: Remove Subsequent Runs from a Vector
### Aliases: fv_runs

### ** Examples

x <- c(1, 1 , 2, 3, 4, 4, 1, 1, 3, 3, NA, 5)
fv_runs(x)
fv_runs(x, fill = '-')
fv_runs(x, fill = '-', missing = 'X')

## Not run: 
##D library(dplyr)
##D set.seed(10)
##D data.frame(
##D     state = sort(sample(state.name[c(1, 5, 9, 12)], 12, TRUE)),
##D     val = rnorm(12)
##D ) %>%
##D     mutate(state2 = fv_runs(state))
## End(Not run)



