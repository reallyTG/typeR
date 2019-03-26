library(MILC)


### Name: nat_hist
### Title: Simulate one individual trajectory
### Aliases: nat_hist
### Keywords: Functions

### ** Examples

# In the following examples we predict lung cancer trajectories for a man, 50 years old 
# at the beginning of the prediction period, who has started smoking at the age of 20 years
# and smokes 30 cigerettes per day on average. The model predicts 20 years ahead. 

# We present three possible trajectories:

# In the first case the person does not die before the end of the prediction period:
set.seed(33)
nat_hist ( c(runif(5),50,30), 20, "male", "current", 20, NA, 
		0.00042, c(3.91, 3.91), c(1.1, 1.1), c(2.8, 2.8))

# In the second case the person dies at the age of 62.43 years from lung cancer:
set.seed(1470)
nat_hist ( c(runif(5),50,30), 20, "male", "current", 20, NA, 
		0.00042, c(3.91, 3.91), c(1.1, 1.1), c(2.8, 2.8))

# In the third case the person dies at the age of 69.68 years from a cause
# other than lung cancer:
set.seed(1450)
nat_hist ( c(runif(5),50,30), 20, "male", "current", 20, NA, 
		0.00042, c(3.91, 3.91), c(1.1, 1.1), c(2.8, 2.8))



