library(netdiffuseR)


### Name: plot_infectsuscep
### Title: Plot distribution of infect/suscep
### Aliases: plot_infectsuscep
### Keywords: hplot

### ** Examples

# Generating a random graph -------------------------------------------------
set.seed(1234)
n <- 100
nper <- 20
graph <- rgraph_er(n,nper, p=.2, undirected = FALSE)
toa <- sample(1:(1+nper-1), n, TRUE)

# Visualizing distribution of suscep/infect
out <- plot_infectsuscep(graph, toa, K=3, logscale = FALSE)



