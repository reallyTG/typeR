library(GreedySBTM)


### Name: ICLExact
### Title: ICLExact
### Aliases: ICLExact

### ** Examples

set.seed(12345)
data(reality_mining_84)
tframes <- dim(reality_mining_84)[3]
N <- dim(reality_mining_84)[1]
allocations <- matrix(sample(1:10,tframes*N,TRUE),tframes,N)
ICLExact(adj_cube = reality_mining_84, allocations = allocations, verbose = FALSE)



