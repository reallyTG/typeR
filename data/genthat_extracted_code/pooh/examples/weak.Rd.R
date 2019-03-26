library(pooh)


### Name: weak
### Title: Equivalence Classes
### Aliases: weak
### Keywords: misc

### ** Examples

to <- sample(1:100, 75, replace = TRUE)
from <- sample(1:100, 75, replace = TRUE)
out <- weak(from, to)
sapply(out, length)



