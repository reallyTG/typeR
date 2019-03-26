library(traj)


### Name: traj-package
### Title: Trajectory Analysis
### Aliases: traj-package traj
### Keywords: package

### ** Examples

# Setup data and time
data = example.data$data
time = example.data$time

# Run step1measures, step2factors and step3clusters
s1 = step1measures(data,time, ID=TRUE)
s2 = step2factors(s1)
s3 = step3clusters(s2)

# Print and plot "traj object"
s3
plot(s3)



