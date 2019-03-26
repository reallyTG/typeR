library(traj)


### Name: step3clusters
### Title: Cluster Trajectories According to the Subset of Measures
###   Selected Previously
### Aliases: step3clusters print.traj plot.traj summary.traj

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


# Run step3measures with predetermined number of colusters
s3.4clusters = step3clusters(s2, nclusters=4)

# Display "traj" object
s3.4clusters
summary(s3.4clusters)
plot(s3.4clusters)

s3$cluster[1:10,]



