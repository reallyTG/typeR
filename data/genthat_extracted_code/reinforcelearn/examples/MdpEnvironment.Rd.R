library(reinforcelearn)


### Name: MdpEnvironment
### Title: MDP Environment
### Aliases: MdpEnvironment

### ** Examples

# Create a Markov Decision Process.
P = array(0, c(2, 2, 2))
P[, , 1] = matrix(c(0.5, 0.5, 0, 1), 2, 2, byrow = TRUE)
P[, , 2] = matrix(c(0, 1, 0, 1), 2, 2, byrow = TRUE)
R = matrix(c(5, 10, -1, 2), 2, 2, byrow = TRUE)
env = makeEnvironment("mdp", transitions = P, rewards = R)
env$reset()
env$step(1L)



