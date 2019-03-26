library(rje)


### Name: quickSort
### Title: Quicksort for Partial Orderings
### Aliases: quickSort
### Keywords: arith optimize

### ** Examples

set.seed(1)
quickSort(powerSet(1:3), f=subsetOrder)
quickSort(powerSet(1:3), f=subsetOrder)
# slightly different answers, but both correposnding
# to a legitimate total ordering.



