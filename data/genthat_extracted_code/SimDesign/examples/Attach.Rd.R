library(SimDesign)


### Name: Attach
### Title: Attach the simulation conditions for easier reference
### Aliases: Attach

### ** Examples

## Not run: 
##D 
##D # does not use Attach()
##D mygenerate <- function(condition, fixed_objects = NULL){
##D     N1 <- condition$sample_sizes_group1
##D     N2 <- condition$sample_sizes_group2
##D     sd <- condition$standard_deviations
##D 
##D     group1 <- rnorm(N1)
##D     group2 <- rnorm(N2, sd=sd)
##D     dat <- data.frame(group = c(rep('g1', N1), rep('g2', N2)),
##D                       DV = c(group1, group2))
##D     dat
##D }
##D 
##D # similar to above, but using the Attach() function instead of indexing
##D mygenerate <- function(condition, fixed_objects = NULL){
##D     Attach(condition)
##D     N1 <- sample_sizes_group1
##D     N2 <- sample_sizes_group2
##D     sd <- standard_deviations
##D 
##D     group1 <- rnorm(N1)
##D     group2 <- rnorm(N2, sd=sd)
##D     dat <- data.frame(group = c(rep('g1', N1), rep('g2', N2)),
##D                       DV = c(group1, group2))
##D     dat
##D }
## End(Not run)



