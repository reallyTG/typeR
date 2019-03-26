library(reinforcelearn)


### Name: Gridworld
### Title: Gridworld
### Aliases: Gridworld

### ** Examples

# Gridworld Environment (Sutton & Barto Example 4.1)
env1 = makeEnvironment("gridworld", shape = c(4L, 4L), goal.states = 0L,
  initial.state = 15L)
env1$reset()
env1$visualize()
env1$step(0L)
env1$visualize()

# Windy Gridworld (Sutton & Barto Example 6.5)
env2 = makeEnvironment("gridworld", shape = c(7, 10), goal.states = 37L,
  reward.step = -1, wind = c(0, 0, 0, 1, 1, 1, 2, 2, 1, 0),
  initial.state = 30L)

# Cliff Walking (Sutton & Barto Example 6.6)
env3 = makeEnvironment("gridworld", shape = c(4, 12), goal.states = 47L,
  cliff.states = 37:46, reward.step = -1, reward.cliff = -100,
  cliff.transition.states = 36L, initial.state = 36L)



