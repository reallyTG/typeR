library(analogue)


### Name: chooseTaxa
### Title: Select taxa (variables) on basis of maximum abundance attained
###   and number of occurrences.
### Aliases: chooseTaxa chooseTaxa.default
### Keywords: methods multivariate

### ** Examples

data(ImbrieKipp)
IK2 <- chooseTaxa(ImbrieKipp, n.occ = 5)
dim(ImbrieKipp)
dim(IK2)

## return a logical vector to select species/columns
chooseTaxa(ImbrieKipp, n.occ = 5, value = FALSE)



