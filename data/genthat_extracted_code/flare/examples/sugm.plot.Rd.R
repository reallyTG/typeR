library(flare)


### Name: sugm.plot
### Title: Graph visualization for an object with S3 class '"sugm"'
### Aliases: sugm.plot

### ** Examples

## load package required
library(flare)

## visualize the hub graph
L = sugm.generator(graph = "hub")
sugm.plot(L$theta)

## visualize the band graph
L = sugm.generator(graph = "band",g=5)
sugm.plot(L$theta)

## visualize the cluster graph
L = sugm.generator(graph = "cluster")
sugm.plot(L$theta)

#show working directory
getwd()
#plot 5 graphs and save the plots as eps files in the working directory  
sugm.plot(L$theta, epsflag = TRUE, cur.num = 5)



