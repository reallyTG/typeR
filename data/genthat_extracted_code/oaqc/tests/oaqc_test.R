stopifnot(require('oaqc'), require('igraph'),  getRversion() >= '3.4')
sessionInfo()
packageDescription("oaqc")

### k4, pure R
k4 <- data.frame(
  source = c(0, 0, 0, 1, 1, 2),
  target = c(1, 2, 3, 2, 3, 3)
)
k4orbits <- oaqc(k4, non_ind_freq = T)
print(k4orbits)

n_orbits <- matrix(0, nrow = 4, ncol = 20)
n_orbits[, 20] <- 1
stopifnot(k4orbits$n_orbits == n_orbits)

e_orbits <- matrix(0, nrow = 6, ncol = 14)
e_orbits[, 14] <- 1
stopifnot(k4orbits$e_orbits == e_orbits)

### k4, igraph
ik4 <- make_graph(t(as.matrix(k4)) + 1) # 'igraph' is 1-based
ik4graph <- oaqc(ik4, non_ind_freq = T)
print(vertex_attr_names(ik4graph))
print(edge_attr_names(ik4graph))

### random ba
n <- 1403
g <- ba.game(n)
print(g)

c <- oaqc(g)
