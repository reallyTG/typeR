library(reinforcelearn)


### Name: makeEnvironment
### Title: Create reinforcement learning environment.
### Aliases: makeEnvironment

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

env = makeEnvironment(step = step, reset = reset, discount = 0.9)
env$reset()
env$step(100)

# Create a Markov Decision Process.
P = array(0, c(2, 2, 2))
P[, , 1] = matrix(c(0.5, 0.5, 0, 1), 2, 2, byrow = TRUE)
P[, , 2] = matrix(c(0, 1, 0, 1), 2, 2, byrow = TRUE)
R = matrix(c(5, 10, -1, 2), 2, 2, byrow = TRUE)
env = makeEnvironment("mdp", transitions = P, rewards = R)

env$reset()
env$step(1L)

# Create a Gridworld.
grid = makeEnvironment("gridworld", shape = c(4, 4),
  goal.states = 15, initial.state = 0)
grid$visualize()

## Not run: 
##D # Create an OpenAI Gym environment.
##D # Make sure you have Python, gym and reticulate installed.
##D env = makeEnvironment("gym", gym.name = "MountainCar-v0")
##D 
##D # Take random actions for 200 steps.
##D env$reset()
##D for (i in 1:200) {
##D   action = sample(env$actions, 1)
##D   env$step(action)
##D   env$visualize()
##D }
##D env$close()
## End(Not run)



