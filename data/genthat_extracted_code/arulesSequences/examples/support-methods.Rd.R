library(arulesSequences)


### Name: support-methods
### Title: Support Counting for Sequences
### Aliases: support support,sequences-method
###   supportingTransactions,sequences-method
### Keywords: models

### ** Examples

## continue example
example(cspade)

## recompute support
s <- support(s2, zaki, control = list(verbose = TRUE, 
                     parameter = list(maxwin = 5)))
data.frame(as(s2, "data.frame"), support = s)

## use default method
k <- support(s2, zaki, control = list(verbose = TRUE))
table(size(s2), sign(k - s))

## the same
s <- supportingTransactions(s2, zaki)
itemFrequency(s)



