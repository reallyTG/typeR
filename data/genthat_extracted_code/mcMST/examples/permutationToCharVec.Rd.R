library(mcMST)


### Name: permutationToCharVec
### Title: Convert permutation to characteristic vector.
### Aliases: permutationToCharVec

### ** Examples

# first generate a random permutation, e.g., representing
# a roundtrip tour in a graph
perm = sample(1:10)
print(perm)
# now convert into an edge list
permutationToCharVec(perm, n = 10)



