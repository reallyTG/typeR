library(cultevo)


### Name: wrap.meaningdistfunction
### Title: Make a meaning distance function vectorisable.
### Aliases: wrap.meaningdistfunction

### ** Examples

trivialdistance <- function(a, b) return(a - b)

trivialmeanings <- as.matrix(3:1)
trivialdistance(trivialmeanings[1], trivialmeanings[2])
trivialdistance(trivialmeanings[1], trivialmeanings[3])
trivialdistance(trivialmeanings[2], trivialmeanings[3])

distmatrixfunction <- wrap.meaningdistfunction(trivialdistance)
distmatrixfunction(trivialmeanings)



