library(cvcrand)


### Name: cptest
### Title: Clustered permutation test for cluster randomized trials
### Aliases: cptest
### Keywords: cluster clustered permutation randomized test, trails

### ** Examples

## Not run: 
##D Analysis_result <- cptest(outcome = Dickinson_outcome$outcome,
##D                           clustername = Dickinson_outcome$county,
##D                           z = data.frame(Dickinson_outcome[ , c(2, 3, 4, 5, 6)]),
##D                           cspacedatname = "dickinson_constrained.csv",
##D                           outcometype = "binary",
##D                           categorical = c("location","incomecat"))
## End(Not run)




