library(multicastR)


### Name: mc_count_clauses
### Title: Count clause units in a multicastR table
### Aliases: mc_count_clauses
### Keywords: internal

### ** Examples

# count clause units in the most recent version
# of the Multi-CAST data, by corpus
n <- mc_count_clauses(multicast())

# number of clauses units in the whole collection
sum(n$nClauses)




