library(qtl)


### Name: formLinkageGroups
### Title: Partition markers into linkage groups
### Aliases: formLinkageGroups
### Keywords: utilities

### ** Examples

data(listeria)
listeria <- est.rf(listeria)
result <- formLinkageGroups(listeria)
tab <- table(result[,1], result[,2])
apply(tab, 1, function(a) sum(a!=0))
apply(tab, 2, function(a) sum(a!=0))



