library(traj)


### Name: step2factors
### Title: Performs Factor Analysis to Select a Subset of the 24 Measures
### Aliases: step2factors

### ** Examples

# Setup data and time
data = example.data$data
time = example.data$time

# Run step1measures and step2factors
s1 = step1measures(data,time, ID=TRUE)
s2 = step2factors(s1)

# Display factors
head(s2$factors)

# The next step would be to run "step3clusters"



