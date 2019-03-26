library(rcss)


### Name: PathDisturb
### Title: Path Simulation
### Aliases: PathDisturb

### ** Examples

## Simulating AR(2) process
start <- c(1, 0, 0)
n_dim <- length(start)
n_path <- 10
psi1 <- 0.3
psi2 <- 0.65
n_dec <- 21
path_disturb <- array(data = matrix(c(1, 0,    0,
                                      0, 0,    1,
                                      0, psi2, psi1), ncol = 3, byrow = TRUE),
                      dim = c(n_dim, n_dim, n_path, (n_dec - 1)))
path_disturb[3,1,,] <- runif(n_path * (n_dec - 1), -1, 1)
path <- PathDisturb(start, path_disturb)



