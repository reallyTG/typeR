library(relations)


### Name: impute
### Title: Impute relations
### Aliases: relation_impute
### Keywords: math

### ** Examples

## create a relation with a missing object
R <- ranking(1:2, 1:3)
print(R)
R <- as.relation(R)

## find all suitable completions within L
ens <- relation_impute(R, method = "any/L", n = "all")
lapply(ens, as.ranking)
if(require("Rgraphviz")) plot(ens)

## find 3 suitable partial orders
ens <- relation_impute(R, method = "any/O", n = 3)
lapply(ens, relation_incidence)
if(require("Rgraphviz")) plot(ens)

## compute average completion
R1 <- relation_impute(R, method = "average/O")
relation_incidence(R1)

## check correctness of averaging
R2 <- mean(relation_impute(R, "any/O", n = "all"))
stopifnot(all.equal(R1, R2))



