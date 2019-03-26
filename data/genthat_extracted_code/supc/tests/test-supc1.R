library(supc)

# checking with reference object

## initializing datasets
X <- local({
  set.seed(1)
  mu <- list(
    x = c(0, 2, 1, 6, 8, 7, 3, 5, 4),
    y = c(0, 0, 1, 0, 0, 1, 3, 3, 4)
  )
  X <- lapply(1:3, function(i) {
    cbind(rnorm(9, mu$x, 1/5), rnorm(9, mu$y, 1/5))
  })
  do.call(rbind, X)
})

## fitting original supc
dist.mode("stats")
implementations <- list(
  function(x) supc1(x, r = .9, t = .75, implementation = "cpp"),
  function(x) supc1(x, r = .9, t = .75, implementation = "R"),
  function(x) supc1(x, r = .9, t = .75, implementation = "cpp2")
)
## construct the reference answer
checkers <- local({
  X.supc.ref <- structure(list(cluster = c(1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 
  1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 
  8L, 9L), centers = structure(c(-0.0180254152322607, 2.046727139439, 
  1.08716939783766, 6.20911417627993, 8.0147761104807, 6.79821207689788, 
  3.1200608974441, 5.08556992438004, 3.97988236811187, -0.162390279741713, 
  0.0922984238508252, 1.10583358958467, 0.0381059301321746, -0.0860889759850034, 
  1.12872658834518, 2.95353852156743, 2.93593224005029, 3.95578772830951
  ), .Dim = c(9L, 2L), .Dimnames = list(c("1", "2", "3", "4", "5", 
  "6", "7", "8", "9"), NULL)), size = structure(c(3L, 3L, 3L, 3L, 
  3L, 3L, 3L, 3L, 3L), .Dim = 9L, .Dimnames = structure(list(cl = c("1", 
  "2", "3", "4", "5", "6", "7", "8", "9")), .Names = "cl"), class = "table"), result = 
    structure(c(-0.0180261933327141, 2.04672690185634, 1.08716459103973, 
6.20911479359631, 8.01478639248956, 6.79821233636245, 3.120060897386, 
5.08557036591521, 3.97988628297925, -0.0180240066479849, 2.04672737537831, 
1.0871717225937, 6.20911329944317, 8.01477212538717, 6.79821139564722, 
3.12006089738845, 5.08556899922362, 3.97988108345371, -0.0180260457145569, 
2.0467271410823, 1.08717187986439, 6.2091144357991, 8.01476981396315, 
6.79821249868371, 3.12006089755786, 5.08557040799994, 3.97987973791727, 
-0.16238970131008, 0.0922997350318823, 1.10583302184102, 0.0381040643950639, 
-0.0861576055475903, 1.12872663987661, 2.95353852178939, 2.9359332333143, 
3.95579429846029, -0.162391325928923, 0.0922972350517618, 1.10583386393582, 
0.0381086887425844, -0.0860622340754393, 1.12872647385683, 2.95353852178015, 
2.93593015772972, 3.95578556171455, -0.162389811987271, 0.0922983014691015, 
1.10583388297537, 0.0381050372627042, -0.0860470909879731, 1.12872665130206, 
2.95353852113276, 2.9359333291038, 3.95578332477825), .Dim = c(27L, 
2L)), iteration = 4L), .Names = c("cluster", 
  "centers", "size", "result", "iteration"))
  ref.check.name <- c("cluster", "centers", "size", "result", "iteration")
  # construct the checker
  class.attr.checker <- function(supc.obj) {
    # check consistency
    stopifnot(class(supc.obj) == "supc")
    attr.ref <- structure(list(names = c("x", "d0", "r", "t", "cluster", "centers", 
  "size", "result", "iteration"), class = "supc"), .Names = c("names", 
  "class"))
    stopifnot(isTRUE(all.equal(attributes(supc.obj), attr.ref)))
    # check with reference object
  }
  value.checker <- function(supc.obj) {
    stopifnot(isTRUE(all.equal(supc.obj[ref.check.name], X.supc.ref)))
  }
  list(class.attr.checker, value.checker)
})
## checking
local({
  # objs <- lapply(implementations, function(f) {
  #   f(X)
  # })
  objs <- list()
  for(f in implementations) {
    objs[[length(objs) + 1 ]] <- f(X)
  }
  for(check in checkers) {
    for(obj in objs) {
      check(obj)
      freq.poly(obj)
      plot(obj)
    }
  }
  NULL
})
  
# Checking with implementation of R

## construct implementations

get.implementations <- function(argv) {
  . <- function(implementation) {
    force(implementation)
    function(x) {
      argv$x <- x
      argv$implementation <- implementation
      do.call(supc1, argv)
    }
  }
  lapply(c("R", "cpp", "cpp2"), .)
}

## construct checkers
checkers <- function(supc.objs) {
  ref.obj <- supc.objs[[1]]
  list.check.names <- c("x", "d0", "r", "cluster", "centers", "size", "result", "iteration")
  for(supc.obj in supc.objs) {
    stopifnot(length(supc.obj) == length(ref.obj))
    for(.i in seq_along(supc.obj)) {
      . <- all.equal(
        supc.obj[[.i]][list.check.names],
        ref.obj[[.i]][list.check.names]
      )
      . <- isTRUE(.)
      if (interactive()) if (!.) browser() else stopifnot(.)
    }
    freq.poly(supc.obj)
    for(obj in supc.obj) {
      plot(obj)
    }
  }
  NULL
}
## checking
.mode.list <- c("stats", "amap")
for(.mode in .mode.list) {
  dist.mode(.mode)
  local({
    . <- get.implementations(list(
      r = quantile(dist(X), seq(.1, .5, by = .1)),
      t = quantile(dist(X), seq(.1, .5, by = .1)) / 5
    ))
    objs <- list()
    for(f in .) {
      objs[[length(objs) + 1]] <- f(X)
    }
    checkers(objs)
    NULL
  })
  
  local({
    . <- get.implementations(list(
      r = quantile(dist(X), seq(.1, .5, by = .1)),
      t = "static"
    ))
    objs <- list()
    for(f in .) {
      objs[[length(objs) + 1]] <- f(X)
    }
    checkers(objs)
    NULL
  })
  
  local({
    . <- get.implementations(list(
      r = quantile(dist(X), seq(.1, .5, by = .1)),
      t = "dynamic"
    ))
    objs <- list()
    for(f in .) {
      objs[[length(objs) + 1]] <- f(X)
    }
    checkers(objs)
    NULL
  })
}

