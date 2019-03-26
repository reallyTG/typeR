library(missCompare)


### Name: impute_data
### Title: Missing data imputation with various methods
### Aliases: impute_data

### ** Examples

## Not run: 
##D #running 10 iterations of all algoritms (that allow for multiple imputation) and
##D #one copy of those that do not allow for multiple imputations
##D impute_data(df, scale = T, n.iter = 10,
##D             sel_method = c(1:16))
##D #running 20 iterations of missForest (e.g. this was the best performing algorithm
##D #in simulations) on a non-scaled dataframe
##D impute_data(df, scale = F, n.iter = 20,
##D             sel_method = c(14))
##D #running 1 iterations of four selected non-probabilistic algorithms on a scaled dataframe
##D impute_data(df, scale = T, n.iter = 1,
##D             sel_method = c(2:3, 5, 7))
## End(Not run)




