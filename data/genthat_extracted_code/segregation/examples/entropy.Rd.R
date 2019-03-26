library(segregation)


### Name: entropy
### Title: Calculates the entropy of a distribution
### Aliases: entropy

### ** Examples

d <- data.frame(cat = c("A", "B"), n = c(25, 75))
entropy(d, "cat", weight = "n") # => .56
# this is equivalent to -.25*log(.25)-.75*log(.75)

d <- data.frame(cat = c("A", "B"), n = c(50, 50))
# use base 2 for the logarithm, then entropy is maximized at 1
entropy(d, "cat", weight = "n", base = 2) # => 1



