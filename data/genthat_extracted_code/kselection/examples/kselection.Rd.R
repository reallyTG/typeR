library(kselection)


### Name: kselection
### Title: Selection of K in K-means Clustering
### Aliases: kselection

### ** Examples

# Create a data set with two clusters
dat <- matrix(c(rnorm(100, 2, .1), rnorm(100, 3, .1),
                rnorm(100, -2, .1), rnorm(100, -3, .1)), 200, 2)

# Execute the method
sol <- kselection(dat)

# Get the results
k   <- num_clusters(sol) # optimal number of clustes
f_k <- get_f_k(sol)      # the f(K) vector

# Plot the results
plot(sol)

## Not run: 
##D # Parallel
##D require(doMC)
##D registerDoMC(cores = 4)
##D 
##D system.time(kselection(dat, max_centers = 50 , nstart = 25))
##D system.time(kselection(dat, max_centers = 50 , nstart = 25, parallel = TRUE))
## End(Not run)



