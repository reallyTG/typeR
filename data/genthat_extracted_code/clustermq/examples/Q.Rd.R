library(clustermq)


### Name: Q
### Title: Queue function calls on the cluster
### Aliases: Q

### ** Examples

## Not run: 
##D # Run a simple multiplication for numbers 1 to 3 on a worker node
##D fx = function(x) x * 2
##D Q(fx, x=1:3, n_jobs=1)
##D # list(2,4,6)
##D 
##D # Run a mutate() call in dplyr on a worker node
##D iris %>%
##D     mutate(area = Q(`*`, e1=Sepal.Length, e2=Sepal.Width, n_jobs=1))
##D # iris with an additional column 'area'
## End(Not run)



