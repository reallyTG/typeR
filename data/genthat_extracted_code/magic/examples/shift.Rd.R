library(magic)


### Name: shift
### Title: Shift origin of arrays and vectors
### Aliases: shift ashift
### Keywords: array

### ** Examples

shift(1:10,3)
m <- matrix(1:100,10,10)
ashift(m,c(1,1))
ashift(m,c(0,1))    #note columns shifted by 1, rows unchanged.
ashift(m,dim(m))    #m unchanged (Mnemonic).



