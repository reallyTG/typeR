library(simecol)


### Name: odeModel
### Title: Generating-functions (Constructors) to Create Objects of Classes
###   'odeModel', 'rwalkModel' and 'gridModel'.
### Aliases: odeModel gridModel rwalkModel indbasedModel
### Keywords: programming

### ** Examples

## (1) Define and run your own simecol model with new ==================

lv <- new("odeModel", 
  main = function (time, init, parms) {
    with(as.list(c(init, parms)), {
      dn1 <-   k1 * N1 - k2 * N1 * N2
      dn2 <- - k3 * N2 + k2 * N1 * N2
      list(c(dn1, dn2))
    })
  },
  parms  = c(k1 = 0.2, k2 = 0.2, k3 = 0.2),
  times  = c(from = 0, to = 100, by = 0.5),
  init   = c(N1 = 0.5, N2 = 1),
  solver = "lsoda"
)

## ... or use the generating function ----------------------------------

lv <- odeModel( 
  main = function (time, init, parms) {
    with(as.list(c(init, parms)), {
      dn1 <-   k1 * N1 - k2 * N1 * N2
      dn2 <- - k3 * N2 + k2 * N1 * N2
      list(c(dn1, dn2))
    })
  },
  parms  = c(k1 = 0.2, k2 = 0.2, k3 = 0.2),
  times  = c(from = 0, to = 100, by = 0.5),
  init   = c(N1 = 0.5, N2 = 1),
  solver = "lsoda"
)

lv <- sim(lv)
plot(lv)

## (2) Conway's Game of Life ==========================================

set.seed(23)  # to make it reproducible

conway <- new("gridModel",
  main = function(time, x, parms) {
    nb     <- eightneighbours(x)
    surviv <- (x >  0 & (nb %in% parms$srv))
    gener  <- (x == 0 & (nb %in% parms$gen))
    x      <- (surviv + gener) > 0
    return(x)
  },
  parms  = list(srv = c(2, 3), gen = 3),
  times  = 1:17,
  init   = matrix(round(runif(1000)), ncol=40),
  solver = "iteration"
)

sim(conway, animate=TRUE)




