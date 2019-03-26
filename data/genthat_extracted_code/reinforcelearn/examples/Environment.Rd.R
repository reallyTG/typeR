library(reinforcelearn)


### Name: Environment
### Title: Custom Reinforcement Learning Environment
### Aliases: Environment

### ** Examples

step = function(self, action) {
  state = list(mean = action + rnorm(1), sd = runif(1))
  reward = rnorm(1, state[[1]], state[[2]])
  done = FALSE
  list(state, reward, done)
}

reset = function(self) {
  state = list(mean = 0, sd = 1)
  state
}

env = makeEnvironment(step = step, reset = reset)
env$reset()
env$step(100)



