library(partitions)


### Name: setparts
### Title: Set partitions
### Aliases: setparts listParts
### Keywords: math

### ** Examples

setparts(4)                # all partitions of a set of 4 elements

setparts(c(3,3,2))         # all partitions of a set of 8 elements
                           # into sets of sizes 3,3,2.


jj <- restrictedparts(5,3)
setparts(jj)               # partitions of a set of 5 elements into
                           # at most 3 sets

listParts(jj)              # induced equivalence classes

setparts(conjugate(jj))    # partitions of a set of 5 elements into
                           # sets not exceeding 3 elements


setparts(diffparts(5))     # partitions of a set of 5 elements into
                           # sets of different sizes





