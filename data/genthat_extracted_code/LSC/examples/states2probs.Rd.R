library(LSC)


### Name: states2probs
### Title: Convert states to vector of probabilities of any given state
### Aliases: states2probs
### Keywords: manip

### ** Examples

state.sim <- sample.int(5, 100, replace = TRUE)
prob.state <- states2probs(states = state.sim)
layout(matrix(1:2, ncol = 2))
plot(state.sim, xlab = "", ylab = "state")
plot(prob.state, xlab = "", ylab = "probability")
plot(state.sim, prob.state, xlab = "state", ylab = "probability", type = "h")



