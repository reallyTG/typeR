library(mcga)


### Name: ByteCodeMutation
### Title: Mutation operator for byte representation of double values
### Aliases: ByteCodeMutation

### ** Examples

set.seed(1246)
print(pi)
bytes <- DoubleToBytes(pi)
mutated.bytes <- ByteCodeMutation(bytes, 0.10) 
new.var <- BytesToDouble(mutated.bytes)
print(new.var)



