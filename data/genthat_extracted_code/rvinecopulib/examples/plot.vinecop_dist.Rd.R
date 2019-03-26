library(rvinecopulib)


### Name: plot.vinecop_dist
### Title: Plotting 'vinecop_dist' and 'vinecop' objects.
### Aliases: plot.vinecop_dist contour.vinecop_dist plot.vinecop
###   contour.vinecop plot.vinecop contour.vinecop_dist contour.vinecop
### Keywords: plot

### ** Examples

# set up vine copula model
d <- 20
n <- 2e2
u <- matrix(runif(n*d), n, d)
vc <- vinecop(u, "indep")

# plot
plot(vc, tree = c(1,2))
plot(vc, edge_labels = "pair")

# set up another vine copula model
pcs <- lapply(1:3, function(j) # pair-copulas in tree j
    lapply(runif(4-j), function(cor) bicop_dist("gaussian", 0, cor)))
mat <- matrix(c(1, 2, 3, 4, 1, 2, 3, 0, 1, 2, 0, 0, 1, 0, 0, 0), 4, 4)
vc <- vinecop_dist(pcs, mat)

# contour plot
contour(vc)




