library(netdiffuseR)


### Name: plot_threshold
### Title: Threshold levels through time
### Aliases: plot_threshold plot_threshold.diffnet plot_threshold.array
###   plot_threshold.default
### Keywords: hplot

### ** Examples


# Generating a random graph
set.seed(1234)
n <- 6
nper <- 5
graph <- rgraph_er(n,nper, p=.3, undirected = FALSE)
toa <- sample(2000:(2000+nper-1), n, TRUE)
adopt <- toa_mat(toa)

# Computing exposure
expos <- exposure(graph, adopt$cumadopt)

plot_threshold(graph, expos, toa)

# Calculating degree (for sizing the vertices)
plot_threshold(graph, expos, toa, vertex.size = "indegree")




