library(ACTCD)


### Name: eta
### Title: Ideal Response Patterns for all possible attribute profiles
### Aliases: eta

### ** Examples

# Generating ideal response patterns
data(sim.Q)
K <- ncol(sim.Q)
J <- nrow(sim.Q)
IRP <- eta(K, J, sim.Q) 



