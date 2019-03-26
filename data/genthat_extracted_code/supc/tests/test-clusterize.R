library(supc)
library(dbscan)

tol <- 1e-4
for(i in 1:10) {
  g1 <- dbscan::dbscan(supc:::.test.m, eps = tol, minPts = 1)$cluster
  g2 <- supc:::.clusterize(supc:::.test.m, tol)
  stopifnot(g1 == g2)
}

cl0 <- supc:::.clusterize(supc:::.test.r, 1e-3)
for(i in 1:100) {
  cl <- supc:::.clusterize(supc:::.test.r, 1e-3)
  stopifnot(isTRUE(all.equal(cl, cl0)))
}
