library(arulesSequences)


### Name: size-methods
### Title: Compute the Size of Sequences
### Aliases: size size,sequences-method ritems ritems,sequences-method
### Keywords: methods

### ** Examples

## continue example
example(cspade)

## default size
size(s2)
size(s2, "itemsets")
size(s2, "length")
size(s2, "items")

## crosstab
table(length = size(s1, "length"),
      items  = size(s1, "items"))

## repetitions
ritems(s1)
ritems(s1, "max")
ritems(s1, "max", TRUE)



