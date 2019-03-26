library(mcompanion)


### Name: mc_0chains
### Title: Generate eigenchains for zero eigenvalues
### Aliases: mc_0chains
### Keywords: mcchain internal

### ** Examples

mc_0chains(6, 4, 1)
mc_0chains(6, 4, 2)
mc_0chains(6, 4, 3)
mc_0chains(6, 4, 4)

mc_0chains(6, 2, 2)
mc_0chains(6, 2, 4)
mc_0chains(6, 2, 3)
mc_0chains(6, 2, 3, list(matrix(1,              ncol=1, nrow=6)))
mc_0chains(6, 2, 3, list(matrix(c(1,0,0,0,0,0), ncol=1, nrow=6)))
mc_0chains(6, 2, 3, list(matrix(c(0,1,0,0,0,0), ncol=1, nrow=6)))
mc_0chains(6, 2, 3, list(matrix(c(0,0,0,0,0,1), ncol=1, nrow=6)))
mc_0chains(6, 2, 3, list(matrix(c(0,0,0,0,1,0), ncol=1, nrow=6)))

mc_0chains(2, 2, 2,list(matrix(c(0,1),ncol=1,nrow=2)))

mc_0chains(12,4,2)



