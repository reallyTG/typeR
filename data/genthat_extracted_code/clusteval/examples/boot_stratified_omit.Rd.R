library(clusteval)


### Name: boot_stratified_omit
### Title: Creates a list of indices for a stratified nonparametric
###   bootstrap.
### Aliases: boot_stratified_omit

### ** Examples

set.seed(42)
# We use 4 clusters, each with up to 10 observations. The sample sizes are
# randomly chosen.
num_clusters <- 4
sample_sizes <- sample(10, num_clusters, replace = TRUE)

# Create the cluster labels, y.
y <- unlist(sapply(seq_len(num_clusters), function(k) {
 rep(k, sample_sizes[k])
}))

# Use 20 reps per group.
boot_stratified_omit(y, num_reps = 20)

# Use the default number of reps per group.
boot_stratified_omit(y)



