library(ReinforcementLearning)


### Name: sampleExperience
### Title: Sample state transitions from an environment function
### Aliases: sampleExperience

### ** Examples

# Define environment
env <- gridworldEnvironment

# Define states and actions
states <- c("s1", "s2", "s3", "s4")
actions <- c("up", "down", "left", "right")

# Sample 1000 training examples
data <- sampleExperience(N = 1000, env = env, states = states, actions = actions)



