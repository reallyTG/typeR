library(traj)


### Name: step1measures
### Title: Compute 24 Measures Describing the Features of the Trajectories
### Aliases: step1measures

### ** Examples

# Setup data and time
data = example.data$data
time = example.data$time

# Run step1measures
s1 = step1measures(data,time, ID=TRUE)

# Display measures
head(s1$measurments)

# Plot mean trajectory of all individuals
plot(s1$measurments$ID, s1$measurments$m5)

# The next step would be to run "step2factors"




