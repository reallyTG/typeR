library(netdiffuseR)


### Name: plot_diffnet
### Title: Plot the diffusion process
### Aliases: plot_diffnet plot_diffnet.diffnet plot_diffnet.default
### Keywords: hplot

### ** Examples

# Generating a random graph
set.seed(1234)
n <- 6
nper <- 5
graph <- rgraph_er(n,nper, p=.3, undirected = FALSE)
toa <- sample(2000:(2000+nper-1), n, TRUE)
adopt <- toa_mat(toa)

plot_diffnet(graph, adopt$cumadopt)



