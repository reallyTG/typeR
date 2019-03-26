library(mcga)


### Name: ByteCodeMutationUsingDoubles
### Title: Mutation operator for byte representation of double values
### Aliases: ByteCodeMutationUsingDoubles

### ** Examples

set.seed(1246)
print(pi)
print(exp(1))
new.var <- ByteCodeMutationUsingDoubles(c(pi, exp(1)), 0.10)
print(new.var)



