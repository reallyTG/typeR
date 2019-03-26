library(ioanalysis)


### Name: f.influence
### Title: Field of Influence
### Aliases: f.influence

### ** Examples

data(toy.IO)
class(toy.IO)
# First order field of influence on L[3,2]
i <- 3
j <- 2
f.influence("toy.IO", i, j)

# Second order field of influence on L[3,2], L[4,5], L[6, 3], and L[1,10]
i <- c(3, 4, 6,  1)
j <- c(2, 5, 3, 10)
f.influence("toy.IO", i, j)




