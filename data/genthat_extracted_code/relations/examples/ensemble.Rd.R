library(relations)


### Name: ensemble
### Title: Relation Ensembles
### Aliases: relation_ensemble as.relation_ensemble is.relation_ensemble
### Keywords: math

### ** Examples

data("Cetacea")
## Consider each variable an equivalence relation on the objects.
## Note that 2 variables (LACHRYMAL_AND_JUGAL_BONES and HEAD_BONES) have
## missing values, and hence are excluded.
ind <- sapply(Cetacea, function(s) all(!is.na(s)))
relations <- as.relation_ensemble(Cetacea[, ind])
## This gives a relation ensemble of length 14 (number of complete
## variables in the data set).
print(relations)
## Are there any duplicated relations?
any(duplicated(relations))
## Replicate and combine ...
thrice <- c(rep(relations, 2), relations)
## Extract unique elements again:
all.equal(unique(thrice), relations)
## Note that unique() does not preserve attributes, and hence names.
## In case we want otherwise:
all.equal(thrice[!duplicated(thrice)], relations)
## Subscripting:
relation_dissimilarity(relations[1 : 2], relations["CLASS"])
## Which relation is "closest" to the classification?
d <- relation_dissimilarity(relations)
sort(as.matrix(d)[, "CLASS"])[-1]



