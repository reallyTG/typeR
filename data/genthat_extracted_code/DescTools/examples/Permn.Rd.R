library(DescTools)


### Name: Permn
### Title: Number and Samples for Permutations or Combinations of a Set
### Aliases: Permn CombSet CombN
### Keywords: math

### ** Examples

Permn(letters[2:5])
Permn(2:5)

# containing the same element more than once
Permn(c("a", "b", "c", "a"))


# only combinations of 2, but in every possible order
x <- letters[1:4]
m <- 2

# the samples
CombSet(x, m, repl=TRUE, ord=FALSE)
CombSet(x, m, repl=TRUE, ord=TRUE)
CombSet(x, m, repl=FALSE, ord=TRUE)
CombSet(x, m, repl=FALSE, ord=FALSE)

# the number of the samples
CombN(x, m, repl=TRUE, ord=FALSE)
CombN(x, m, repl=TRUE, ord=TRUE)
CombN(x, m, repl=FALSE, ord=TRUE)
CombN(x, m, repl=FALSE, ord=FALSE)

# build all subsets of length 1, 3 and 5 and return a flat list
x <- letters[1:5]
CombSet(x=x, m=c(1, 3, 5), as.list=TRUE)




