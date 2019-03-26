library(simecol)


### Name: CA
### Title: Stochastic Cellular Automaton
### Aliases: CA
### Keywords: datasets

### ** Examples

##============================================
## Basic Usage:
##   work with the example
##============================================
data(CA)
times(CA)["to"] <- 10
plot(sim(CA))

set.seed(345)
times(CA)["to"] <- 50
CA <- sim(CA)

library(lattice)
tcol <- (terrain.colors(13))[-13]
x <- out(CA, last=TRUE)
x <- ifelse(x == 0, NA, x)
levelplot(x,
  cuts = 11,
  col.regions = tcol,
  colorkey = list(at = seq(0, 55, 5))
)

##============================================
## Implementation:
##   The code of the CA model
##============================================
CA <- new("gridModel",
  main = function(time, init, parms) {
    z     <- init
    nb    <- eightneighbors(z)
    pgen  <- 1 - (1 - parms$pbirth)^nb
    zgen  <- ifelse(z == 0 &
               runif(z) < pgen, 1, 0)
    zsurv <- ifelse(z >= 1 &
               runif(z) < (1 - parms$pdeath),
               z + 1, 0)
    zgen + zsurv
  },
  parms = list(pbirth = 0.02, pdeath = 0.01),
  times = c(from = 1, to = 50, by = 1),
  init = matrix(0, nrow = 40, ncol = 40),
  solver = "iteration"
)
init(CA)[18:22,18:22] <- 1
##============================================



