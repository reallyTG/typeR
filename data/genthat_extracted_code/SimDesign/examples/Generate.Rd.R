library(SimDesign)


### Name: Generate
### Title: Generate data
### Aliases: Generate

### ** Examples

## Not run: 
##D 
##D mygenerate <- function(condition, fixed_objects = NULL){
##D     N1 <- condition$sample_sizes_group1
##D     N2 <- condition$sample_sizes_group2
##D     sd <- condition$standard_deviations
##D 
##D     group1 <- rnorm(N1)
##D     group2 <- rnorm(N2, sd=sd)
##D     dat <- data.frame(group = c(rep('g1', N1), rep('g2', N2)),
##D                       DV = c(group1, group2))
##D     # just a silly example of a simulated parameter
##D     pars <- list(random_number = rnorm(1))
##D 
##D     list(dat=dat, parameters=pars)
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
##D 
##D mygenerate2 <- function(condition, fixed_objects = NULL){
##D     mu <- sample(c(-1,0,1), 1)
##D     dat <- rnorm(100, mu)
##D     dat        #return simple vector (discard mu information)
##D }
##D 
##D mygenerate3 <- function(condition, fixed_objects = NULL){
##D     mu <- sample(c(-1,0,1), 1)
##D     dat <- data.frame(DV = rnorm(100, mu))
##D     dat
##D }
##D 
## End(Not run)




