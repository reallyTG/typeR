library(NoiseFiltersR)


### Name: C45ensembles
### Title: Classical Filters based on C4.5
### Aliases: C45ensembles C45iteratedVotingFilter
###   C45iteratedVotingFilter.default C45iteratedVotingFilter.formula
###   C45robustFilter C45robustFilter.default C45robustFilter.formula
###   C45votingFilter C45votingFilter.default C45votingFilter.formula

### ** Examples

# Next example is not run in order to save time
## Not run: 
##D data(iris)
##D out1 <- C45robustFilter(Species~.-Sepal.Length, iris)
##D # We fix a seed since next two functions create partitions of data for the ensemble
##D set.seed(1)
##D out2 <- C45votingFilter(iris, consensus = TRUE)
##D out3 <- C45iteratedVotingFilter(Species~., iris, nfolds = 5)
##D print(out1)
##D print(out2)
##D print(out3)
##D identical(out1$cleanData,iris[setdiff(1:nrow(iris),out1$remIdx),])
##D identical(out2$cleanData,iris[setdiff(1:nrow(iris),out2$remIdx),])
##D identical(out3$cleanData,iris[setdiff(1:nrow(iris),out3$remIdx),])
## End(Not run)



