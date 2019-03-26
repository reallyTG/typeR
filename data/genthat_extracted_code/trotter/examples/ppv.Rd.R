library(trotter)


### Name: ppv
### Title: Permutations Pseudo-Vector Constructor
### Aliases: permutation permutations ppv

### ** Examples

# create a pseudo-vector of 5-permutations from the first 10 letters
p <- ppv(5, letters[1:10])
# generate a description
print(p)
# compatable with length
length(p)
# inspect a few of the permutations "stored" in p
p[1]
p[1000]
p[30240]



