library(kselection)


### Name: num_clusters_all
### Title: Get all recommended numbers of clusters
### Aliases: num_clusters_all

### ** Examples

# Create a data set with two clusters
dat <- matrix(c(rnorm(100, 2, .1), rnorm(100, 3, .1),
                rnorm(100, -2, .1), rnorm(100, -3, .1)), 200, 2)

# Get the optimal number of clustes
sol <- kselection(dat)
k   <- num_clusters(sol)



