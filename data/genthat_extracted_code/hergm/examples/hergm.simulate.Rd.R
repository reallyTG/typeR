library(hergm)


### Name: simulate.hergm
### Title: Simulate network
### Aliases: simulate.hergm hergm.simulate simulate

### ** Examples

## Not run: 
##D data(example)
##D 
##D # Simulate network given 'object' of class 'hergm':
##D object <- hergm(d ~ edges_ij + triangle_ijk)
##D simulate.hergm(object) 
##D 
##D # Simulate network given 'formula':
##D indicator <- c(rep.int(1, 10), rep.int(2, 10))
##D eta <- c(-1, -1, -2, 1, 1, 0)
##D simulate.hergm(d ~ edges_ij + triangle_ijk, max_number = 2, indicator = indicator, eta = eta)
## End(Not run)



