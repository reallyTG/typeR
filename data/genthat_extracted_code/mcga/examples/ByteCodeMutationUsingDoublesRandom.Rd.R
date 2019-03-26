library(mcga)


### Name: ByteCodeMutationUsingDoublesRandom
### Title: Mutation operator for byte representation of double values
### Aliases: ByteCodeMutationUsingDoublesRandom

### ** Examples

set.seed(1246)
print(pi)
print(exp(1))
new.var <- ByteCodeMutationUsingDoublesRandom(c(pi, exp(1)), 0.10)
print(new.var)



