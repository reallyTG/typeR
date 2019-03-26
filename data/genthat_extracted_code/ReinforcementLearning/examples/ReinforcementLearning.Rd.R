library(ReinforcementLearning)


### Name: ReinforcementLearning
### Title: Performs reinforcement learning
### Aliases: ReinforcementLearning rl

### ** Examples

# Sampling data (1000 grid sequences)
data <- sampleGridSequence(1000)

# Setting reinforcement learning parameters
control <- list(alpha = 0.1, gamma = 0.1, epsilon = 0.1)

# Performing reinforcement learning
model <- ReinforcementLearning(data, s = "State", a = "Action", r = "Reward",
s_new = "NextState", control = control)

# Printing model
print(model)

# Plotting learning curve
plot(model)



