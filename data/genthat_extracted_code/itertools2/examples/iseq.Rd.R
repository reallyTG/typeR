library(itertools2)


### Name: iseq
### Title: Iterators for sequence generation
### Aliases: iseq iseq_along iseq_len

### ** Examples

it <- iseq(from=2, to=5)
unlist(as.list(it)) == 2:5

it2 <- iseq_len(4)
unlist(as.list(it2)) == 1:4

it3 <- iseq_along(iris)
unlist(as.list(it3)) == 1:length(iris)



