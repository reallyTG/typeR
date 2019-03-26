library(fastclime)


### Name: fastclime.plot
### Title: Graph visualization
### Aliases: fastclime.plot

### ** Examples

## visualize the hub graph
L = fastclime.generator(graph = "hub")
fastclime.plot(L$theta)

## visualize the band graph
L = fastclime.generator(graph = "band",g=5)
fastclime.plot(L$theta)

## visualize the cluster graph
L = fastclime.generator(graph = "cluster")
fastclime.plot(L$theta)

#show working directory
getwd()
#plot 5 graphs and save the plots as eps files in the working directory  
fastclime.plot(L$theta, epsflag = TRUE, cur.num = 5)



