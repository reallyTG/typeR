library(supc)
data("golub", package = "supc")

check.cl <- function(supc.obj, cluster.tolerance = 1e-3) {
  cl <- supc.obj$cluster
  r <- supc.obj$result
  for(i in seq_len(max(cl))) {
    . <- dist(r[cl == i,,drop = FALSE])
    if (length(.) > 0) {
      stopifnot(max(.) < cluster.tolerance)
    }
  }
}

if (Sys.getenv("TEST_GOLUB") == "TRUE") {
  print(system.time(
    golub.cpp <- supc1(golub, r = 4, t = "dynamic", implementation = "cpp", verbose = TRUE)
    ))
  check.cl(golub.cpp)
  cat("===\n")
  print(system.time(
    golub.cpp2 <- supc1(golub, r = 4, t = "dynamic", implementation = "cpp2", verbose = TRUE)
    ))
  check.cl(golub.cpp2)
  cat("===\n")
  print(system.time(
    golub.r <- supc1(golub, r = 4, t = "dynamic", implementation = "R", verbose = TRUE)
    ))
  check.cl(golub.r)
  stopifnot(isTRUE(all.equal(golub.cpp, golub.cpp2)))
  stopifnot(isTRUE(all.equal(golub.cpp, golub.r)))
  
  cat("===\n")
  print(system.time(
    golub.random.r <- supc.random(golub, r = 4, t = "dynamic", k = 10, implementation = "R", verbose = TRUE)
  ))
  print(system.time(
    golub.random.cpp <- supc.random(golub, r = 4, t = "dynamic", k = 10, implementation = "cpp", verbose = TRUE, groups = golub.random.r$groups)
  ))
  check.names.ref <- c("x", "r", "cluster", "centers", "size")
  stopifnot(isTRUE(all.equal(
    golub.random.r[check.names.ref],
    golub.random.cpp[check.names.ref]
  )))
}
