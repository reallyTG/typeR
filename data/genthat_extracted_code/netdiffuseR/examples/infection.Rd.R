library(netdiffuseR)


### Name: infection
### Title: Susceptibility and Infection
### Aliases: infection susceptibility
### Keywords: univar

### ** Examples


# Creating a random dynamic graph
set.seed(943)
graph <- rgraph_er(n=100, t=10)
toa <- sample.int(10, 100, TRUE)

# Computing infection and susceptibility (K=1)
infection(graph, toa)
susceptibility(graph, toa)

# Now with K=4
infection(graph, toa, K=4)
susceptibility(graph, toa, K=4)




