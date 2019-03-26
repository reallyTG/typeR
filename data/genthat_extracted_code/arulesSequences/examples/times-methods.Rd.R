library(arulesSequences)


### Name: times-methods
### Title: Compute Time Statistics of Sequences
### Aliases: times times,timedsequences-method
### Keywords: methods

### ** Examples

## continue example
example("timedsequences-class")

##
times(z)
times(z, "gaps")

## all defined
times(z, "span")

## crosstab
table(size = size(z), span = times(z, "span"))



