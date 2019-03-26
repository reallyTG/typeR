library(arules)


### Name: is.superset
### Title: Find Super and Subsets
### Aliases: is.subset is.subset,itemMatrix-method
###   is.subset,associations-method is.superset
###   is.superset,itemMatrix-method is.superset,associations-method
### Keywords: manip

### ** Examples

data("Adult")
set <- eclat(Adult, parameter = list(supp = 0.8))

### find the supersets of each itemset in set
is.superset(set, set)
is.superset(set, set, sparse = FALSE)



