library(permutations)


### Name: as.function.permutation
### Title: Coerce a permutation to a function
### Aliases: as.function.permutation as.function.word as.function.cycle

### ** Examples

x <- cyc_len(3)
y <- cyc_len(5)

xfun <- as.function(x)
yfun <- as.function(y)

stopifnot(xfun(yfun(2)) == as.function(y*x)(2)) # note transposition of x & y

# written in postfix notation one has the very appealing form x(fg) = (xf)g

# it's vectorized:
as.function(rperm(10,9))(1)   
as.function(as.cycle(1:9))(sample(9))



