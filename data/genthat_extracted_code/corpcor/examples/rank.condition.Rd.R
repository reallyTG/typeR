library(corpcor)


### Name: rank.condition
### Title: Positive Definiteness of a Matrix, Rank and Condition Number
### Aliases: is.positive.definite make.positive.definite rank.condition
### Keywords: algebra

### ** Examples

# load corpcor library
library("corpcor")

# Hilbert matrix
hilbert = function(n) { i = 1:n; 1 / outer(i - 1, i, "+") }

# positive definite ?
m = hilbert(8)
is.positive.definite(m)

# numerically ill-conditioned
m = hilbert(15)
rank.condition(m)

# make positive definite
m2 = make.positive.definite(m)
is.positive.definite(m2)
rank.condition(m2)
m2 - m



