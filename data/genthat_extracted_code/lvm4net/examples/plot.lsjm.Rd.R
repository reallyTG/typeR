library(lvm4net)


### Name: plot.lsjm
### Title: Two dimensional plot of Latent Space Joint Model output
### Aliases: plot.lsjm

### ** Examples

## Simulate Undirected Network
  N <- 20
  Ndata <- 2
   Y <- list()
   Y[[1]] <- network(N, directed = FALSE)[,]
   ### create a new view that is similar to the original
  for(nd in 2:Ndata){
    Y[[nd]] <- Y[[nd - 1]] - sample(c(-1, 0, 1), N * N, replace = TRUE, 
    prob = c(.05, .85, .1))
    Y[[nd]] <- 1 * (Y[[nd]]  > 0 )
  diag(Y[[nd]]) <- 0
   }

par(mfrow = c(1, 2))
z <- plotY(Y[[1]], verbose = TRUE, main = 'Network 1')
plotY(Y[[2]], EZ = z, main = 'Network 2')
par(mfrow = c(1, 1))

modLSJM <- lsjm(Y, D = 2) 
plot(modLSJM, Y, drawCB = TRUE)
plot(modLSJM, Y, drawCB = TRUE, plotZtilde = TRUE)



