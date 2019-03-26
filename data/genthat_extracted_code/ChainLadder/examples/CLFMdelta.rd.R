library(ChainLadder)


### Name: CLFMdelta
### Title: Find "selection consistent" values of delta
### Aliases: CLFMdelta
### Keywords: models

### ** Examples


x <- RAA[1:9,1]
y <- RAA[1:9,2]
F <- y/x
CLFMdelta(RAA[1:9, 1:2], selected = mean(F)) # value is 2, 'foundSolution' is TRUE
CLFMdelta(RAA[1:9, 1:2], selected = sum(y) / sum(x)) # value is 1, 'foundSolution' is TRUE

selected <- mean(c(mean(F), sum(y) / sum(x))) # an average of averages
CLFMdelta(RAA[1:9, 1:2], selected) # about 1.725
CLFMdelta(RAA[1:9, 1:2], selected = 2) # negative solutions are possible

# Demonstrating an "unreasonable" selected factor.
CLFMdelta(RAA[1:9, 1:2], selected = 1.9) # NA solution, with warning




