library(Rnets)


### Name: signed_modularity
### Title: Robust Estimator of modularity (Gomez, et al 2009)
### Aliases: signed_modularity

### ** Examples

## No test: 
#Signed modularity in a random graph with 10 vertices

x <- sample_gnp(5, 0.4)  #Creates a random graph with 10 vertices and density ~ 40%
x <- set_edge_attr(x, 'weight', value = runif(gsize(x), -0.5, 0.5))  
     #Randomly assign edge weights to edge attribute 'weight', both positive and negative
x <- set_vertex_attr(x, name = 'group', value = sample(c('red', 'blue'), size = 5, replace = TRUE))

signed_modularity(x, membership = 'group', weight = 'weight')
signed_modularity(x, membership = 'group')

## End(No test)



