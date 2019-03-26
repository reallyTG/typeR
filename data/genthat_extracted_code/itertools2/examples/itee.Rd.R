library(itertools2)


### Name: itee
### Title: Returns a list of n independent iterators from a single iterable
###   object
### Aliases: itee

### ** Examples

# Creates a list of three iterators.
# Each iterator iterates through 1:5 independently.
iter_list <- itee(1:5, n=3)

# Consumes the first iterator
unlist(as.list(iter_list[[1]])) == 1:5

# We can iterate through the remaining two iterators in any order.
iterators::nextElem(iter_list[[2]]) # 1
iterators::nextElem(iter_list[[2]]) # 2

iterators::nextElem(iter_list[[3]]) # 1
iterators::nextElem(iter_list[[3]]) # 2

iterators::nextElem(iter_list[[2]]) # 3
iterators::nextElem(iter_list[[2]]) # 4
iterators::nextElem(iter_list[[2]]) # 5

iterators::nextElem(iter_list[[3]]) # 3
iterators::nextElem(iter_list[[3]]) # 4
iterators::nextElem(iter_list[[3]]) # 5



