library(igraph)


### Name: plot.sir
### Title: Plotting the results on multiple SIR model runs
### Aliases: plot.sir
### Keywords: graphs

### ** Examples


g <- sample_gnm(100, 100)
sm <- sir(g, beta=5, gamma=1)
plot(sm)




