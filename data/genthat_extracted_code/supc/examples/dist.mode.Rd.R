library(supc)


### Name: dist.mode
### Title: Configure which package is used to compute the distance matrix
### Aliases: dist.mode

### ** Examples

# use stats::dist to compute the pairwise distance
dist.mode("stats") 
## use gputools to compute the pairwise distance with GPU
# dist.mode("gputools", function(x) gputools::gpuDist(x, method = "euclidean", p = 2.0)) 



