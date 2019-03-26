library(permutations)


### Name: permutation
### Title: Functions to create and coerce word objects and cycle objects
### Aliases: permutation is.permutation cycle as.cycle is.cycle word
###   as.word is.word cycle2word char2cycle cyc_len as.matrix
###   as.matrix.word
### Keywords: symbmath

### ** Examples

word(matrix(1:8,7,8))
cycle(list(list(c(1,8,2),c(3,6)),list(1:2, 4:8)))

char2cycle(c("(1,4)(6,7)","(3,4,2)(8,19)", "(56)","(12345)(78)","(78)"))

jj <- c(4,2,3,1)

as.word(jj)
as.cycle(jj)

as.cycle(1:2)*as.cycle(1:8) == as.cycle(1:8)*as.cycle(1:2)  # FALSE!

x <- rperm(10,7)
y <- rperm(10,7)
as.cycle(commutator(x,y))

cycle(sapply(seq_len(9),function(n){list(list(seq_len(n)))}))

cycle(sapply(seq_len(18),cyc_len))




