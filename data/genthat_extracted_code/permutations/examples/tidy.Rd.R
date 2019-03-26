library(permutations)


### Name: tidy
### Title: Utilities to neaten permutation objects
### Aliases: tidy trim
### Keywords: symbolmath

### ** Examples

tidy(as.cycle(5:3)+as.cycle(7:9))
as.cycle(tidy(c(as.cycle(1:2),as.cycle(6:7))))


nicify_cyclist(list(c(4,6), c(7), c(2,5,1), c(8,3)))

data(megaminx)
tidy(megaminx)  # has 120 columns, not 129
stopifnot(all(unique(sort(unlist(as.cycle(tidy(megaminx)),recursive=TRUE)))==1:120))

jj <- megaminx*megaminx[1]
stopifnot(identical(shape(jj),shape(tidy(jj))))  #tidy() does not change shape







