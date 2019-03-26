library(comato)


### Name: Hopkins.index
### Title: Non-randomness of data
### Aliases: Hopkins.index

### ** Examples

## Not run: 
##D #Random data generation, 10 dimensions, 500 observations, 2 clusters, 
##D #Multivariate-Bernoulli distributed
##D require("gtools")
##D data = c()
##D p = 0.0
##D for (i in 1:2)
##D {
##D temp = c()
##D for (j in 1:10)
##D temp = cbind(temp, rbinom(250, 1, p+(i-1)*0.5+(0.025*i)*j))  
##D data=rbind(data, temp)
##D }
##D data = data[permute(1:500),]
##D 
##D Hopkins.index(data)
## End(Not run)



