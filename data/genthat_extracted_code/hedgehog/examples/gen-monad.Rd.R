library(hedgehog)


### Name: gen-monad
### Title: Generators
### Aliases: gen-monad gen gen.and_then gen.bind gen.pure gen.impure
###   gen.with gen.map

### ** Examples


# Create a generator which produces a number between
# 1 and 30
one_to_30 <- gen.element(1:30)

# Use this to create a simple vector of 6 numbers
# between 1 and 30.
vector_one_to_30 <- gen.c(of = 6, one_to_30)

# Create a matrix 2 by 3 matrix using said vector
gen.map(function(x) matrix(x, ncol=3), vector_one_to_30)

# To create a generator from a normal R random function
# use gen.impure (this generator does not shrink).
g <- gen.impure(function(size) sample(1:10) )
gen.example(g)
# [1]  5  6  3  4  8 10  2  7  9  1

# Composing generators with `gen.bind` and `gen.with` is
# easy. Here we make a generator which first build a length,
# then, elements of that length.
g <- gen.bind(function(x) gen.c(of = x, gen.element(1:10)), gen.element(2:100))
gen.example ( g )
# [1] 8 6 2 7 5 4 2 2 4 6 4 6 6 3 6 7 8 5 4 6



