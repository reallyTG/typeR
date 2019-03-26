library(HiddenMarkov)


### Name: compdelta
### Title: Marginal Distribution of Stationary Markov Chain
### Aliases: compdelta
### Keywords: distribution

### ** Examples

Pi <- matrix(c(1/2, 1/2,   0,   0,   0,
               1/3, 1/3, 1/3,   0,   0,
                 0, 1/3, 1/3, 1/3,   0,
                 0,   0, 1/3, 1/3, 1/3,
                 0,   0,   0, 1/2, 1/2),
             byrow=TRUE, nrow=5)

print(compdelta(Pi))



