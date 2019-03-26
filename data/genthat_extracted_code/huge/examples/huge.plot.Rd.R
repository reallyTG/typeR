library(huge)


### Name: huge.plot
### Title: Graph visualization
### Aliases: huge.plot

### ** Examples

## visualize the hub graph
L = huge.generator(graph = "hub")
huge.plot(L$theta)

## visualize the band graph
L = huge.generator(graph = "band",g=5)
huge.plot(L$theta)

## visualize the cluster graph
L = huge.generator(graph = "cluster")
huge.plot(L$theta)

#show working directory
getwd()
#plot 5 graphs and save the plots as eps files in the working directory  
huge.plot(L$theta, epsflag = TRUE, cur.num = 5)



