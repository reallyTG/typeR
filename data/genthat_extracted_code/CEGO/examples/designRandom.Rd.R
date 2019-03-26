library(CEGO)


### Name: designRandom
### Title: Random Design
### Aliases: designRandom
### Keywords: internal

### ** Examples

# Create a design of 10 permutations, each with 5 elements
design <- designRandom(NULL,function()sample(5),10)
# Create a design of 20 real valued 2d vectors
design <- designRandom(NULL,function()runif(2),20)



