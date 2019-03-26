library(arulesSequences)


### Name: itemFrequency-methods
### Title: Count Items or Itemsets
### Aliases: itemFrequency itemFrequency,sequences-method
###   itemTable,sequences-method itemTable nitems nitems,sequences-method
###   dim dim,sequences-method dim,timedsequences-method
###   length,sequences-method length,sequencerules-method length
### Keywords: models

### ** Examples

## continue example
example(cspade)

##
itemFrequency(s2)
itemFrequency(s2, itemsets = TRUE)

##
itemTable(s2)
itemTable(s2, itemsets = TRUE)

##
nitems(s2)
nitems(s2, itemsets = TRUE)

##
length(s2)
dim(s2)

##
z <- as(zaki, "timedsequences")
dim(z)



