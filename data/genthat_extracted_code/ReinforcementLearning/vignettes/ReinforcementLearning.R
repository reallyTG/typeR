## ---- include=FALSE------------------------------------------------------
set.seed(0)

## ----eval=FALSE----------------------------------------------------------
#  # install.packages("devtools")
#  
#  # Option 1: download and install latest version from GitHub
#  devtools::install_github("nproellochs/ReinforcementLearning")
#  
#  # Option 2: install directly from bundled archive
#  devtoos::install_local("ReinforcementLearning_1.0.0.tar.gz")

## ---- message=FALSE------------------------------------------------------
library(ReinforcementLearning)

## ---- message=FALSE------------------------------------------------------
data("tictactoe")
head(tictactoe, 5)

## ---- message=FALSE------------------------------------------------------
# Load exemplary environment (gridworld)
env <- gridworldEnvironment
print(env)

# Define state and action sets
states <- c("s1", "s2", "s3", "s4")
actions <- c("up", "down", "left", "right")

# Sample N = 1000 random sequences from the environment
data <- sampleExperience(N = 1000, env = env, states = states, actions = actions)
head(data)

## ---- message=FALSE------------------------------------------------------
# Define reinforcement learning parameters
control <- list(alpha = 0.1, gamma = 0.5, epsilon = 0.1)

# Perform reinforcement learning
model <- ReinforcementLearning(data, s = "State", a = "Action", r = "Reward", 
                               s_new = "NextState", control = control)

# Print result
print(model)

## ---- message=FALSE------------------------------------------------------
# Print policy
policy(model)

## ---- message=FALSE------------------------------------------------------
# Define reinforcement learning parameters
control <- list(alpha = 0.1, gamma = 0.5, epsilon = 0.1)

# Sample N = 1000 sequences from the environment using epsilon-greedy action selection
data_new <- sampleExperience(N = 1000, env = env, states = states, actions = actions, 
                             model = model, actionSelection = "epsilon-greedy", 
                             control = control)
head(data_new)

# Update the existing policy using new training data
model_new <- ReinforcementLearning(data_new, s = "State", a = "Action", r = "Reward", 
                                   s_new = "NextState", control = control, model = model)

# Print result
print(model_new)
summary(model_new)

## ---- message=FALSE, fig.width=5, fig.height=3---------------------------
# Plot reinforcement learning curve
plot(model_new)

## ---- eval=FALSE---------------------------------------------------------
#  # Define control object
#  control <- list(alpha = 0.1, gamma = 0.1, epsilon = 0.1)
#  
#  # Pass learning parameters to reinforcement learning function
#  model <- ReinforcementLearning(data, iter = 10, control = control)

## ---- eval=FALSE---------------------------------------------------------
#  # Load dataset
#  data("tictactoe")
#  
#  # Define reinforcement learning parameters
#  control <- list(alpha = 0.2, gamma = 0.4, epsilon = 0.1)
#  
#  # Perform reinforcement learning
#  model <- ReinforcementLearning(tictactoe, s = "State", a = "Action", r = "Reward",
#                                 s_new = "NextState", iter = 1, control = control)
#  
#  # Print optimal policy
#  policy(model)

