library(traj)


### Name: plotBoxplotTraj
### Title: Plot Boxplot of 'traj' Object
### Aliases: plotBoxplotTraj

### ** Examples

# Setup data and time
data = example.data$data
time = example.data$time

# Run step1measures, step2factors and step3clusters with
# a predetermined number of clusters
s1 = step1measures(data,time, ID=TRUE)
s2 = step2factors(s1)
s3.4clusters = step3clusters(s2, nclust = 4)

# Plot boxplots
plotBoxplotTraj(s3.4clusters)



