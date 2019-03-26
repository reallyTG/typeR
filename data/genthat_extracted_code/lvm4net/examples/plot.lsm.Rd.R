library(lvm4net)


### Name: plot.lsm
### Title: Two dimensional plot of the Latent Space Model output
### Aliases: plot.lsm

### ** Examples

N <- 20
Y <- network(N, directed = FALSE)[,]

modLSM <- lsm(Y, D = 2) 
plot(modLSM, Y)

# Plot with 95% CB
plot(modLSM, Y, drawCB = TRUE)
# Plot with 99% CB
plot(modLSM, Y, drawCB = TRUE, LEVEL = .99)



