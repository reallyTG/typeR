## ------------------------------------------------------------------------
# make results reproducible
set.seed(1000)

pseudorandomranks <- function(...)
  unlist(lapply(list(...), function(p) if (length(p) > 1) sample(p) else p))

lowestthenrandom <- function()
  pseudorandomranks(1, 2:10)

# example ordering
t(replicate(4, lowestthenrandom()))

## ------------------------------------------------------------------------
library(cultevo)

sampleLs <- function(datafun, nrepetitions) {
  ps <- list("0.001" = 0, "0.01" = 0, "0.05" = 0, "NS" = 0)
  for (i in seq(nrepetitions)) {
    p <- page.test(datafun(), verbose=FALSE)$p.value
    if (p <= 0.001) {
      p <- "0.001"
    } else if (p <= 0.01) {
      p <- "0.01"
    } else if (p <= 0.05) {
      p <- "0.05"
    } else {
      p <- "NS"
    }
    ps[[p]] <- ps[[p]] + 1
  }
  unlist(ps) / nrepetitions
}

# choose some N (number of replications)
sampleps <- function(testfun, N, datafun, nrepetitions=1000)
  testfun(function() t(replicate(N, datafun())), nrepetitions)

## ------------------------------------------------------------------------
sampleps(sampleLs, N=4, lowestthenrandom)

## ------------------------------------------------------------------------
sampleps(sampleLs, N=10, lowestthenrandom)

## ------------------------------------------------------------------------
sampleps(sampleLs, N=4, function() pseudorandomranks(1:2, 3:10))

## ------------------------------------------------------------------------
# abrupt upwards jump after the first three observations, but the
# remaining seven observations exhibit a consistent downwards trend
upwardsjumpdownardstrend <- function() pseudorandomranks(1:3, 10, 9, 8, 7, 6, 5, 4)
sampleps(sampleLs, N=4, upwardsjumpdownardstrend)

# start around the middle, then sudden downward followed by extreme upwards jump
updownup <- function() pseudorandomranks(3:4, 5:6, 1:2, 7:8)
sampleps(sampleLs, N=4, updownup)

