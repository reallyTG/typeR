library(lvm4net)


### Name: lsm
### Title: Latent Space Model
### Aliases: lsm

### ** Examples

### Simulate Undirected Network
N <- 20
Y <- network(N, directed = FALSE)[,]

modLSM <- lsm(Y, D = 2) 
plot(modLSM, Y)



