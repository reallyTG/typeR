library(traj)


### Name: wrapperTraj
### Title: Wrapper Function to Perform Trajectory Analysis
### Aliases: wrapperTraj

### ** Examples

# Setup data and time
data = example.data$data
time = example.data$time

# Run clustering wrapper function
wt = wrapperTraj(data, time, ID = TRUE)

# Display and plot "traj" object
wt
summary(wt)

plot(wt)



