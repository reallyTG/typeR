library(arulesSequences)


### Name: subset-methods
### Title: Subset Objects
### Aliases: subset subset,sequences-method subset,sequencerules-method
###   [,sequences-method [,timedsequences-method [,sequencerules-method
###   [,sequences,ANY,ANY,ANY-method [,timedsequences,ANY,ANY,ANY-method
###   [,sequencerules,ANY,missing,ANY-method unique,sequences-method
###   unique,sequencerules-method unique lhs,sequencerules-method lhs
###   rhs,sequencerules-method rhs
### Keywords: manip

### ** Examples

## continue example
example(ruleInduction, package = "arulesSequences")

## matching a pattern
as(subset(s2, size(x) > 1), "data.frame")
as(subset(s2, x %ain% c("B", "F")), "data.frame")

## as well as a measure
as(subset(s2, x %ain% c("B", "F") & support == 1), "data.frame")

## matching a pattern in the left-hand side
as(subset(r2, lhs(x) %ain% c("B", "F")), "data.frame")

## matching a derived measure
as(subset(r2, coverage(x) == 1), "data.frame")

## reduce
s <- s2[11, reduce = TRUE]
itemLabels(s)
itemLabels(s2)

## drop initial events
z <- as(zaki, "timedsequences")
summary(z[1,,-1])



