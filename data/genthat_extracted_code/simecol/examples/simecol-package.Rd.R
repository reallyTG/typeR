library(simecol)


### Name: simecol-package
### Title: Simulation of Ecological (and Other) Dynamic Systems
### Aliases: simecol-package simecol simObj simObj-class odeModel-class
###   gridModel-class rwalkModel-class indbasedModel-class
### Keywords: misc

### ** Examples

## (1) Quick Start Examples ====================================================

data(lv)        # load basic Lotka-Volterra model

## Not run: 
##D require("tcltk")
##D lv <- editParms(lv)
## End(Not run)
parms(lv)
main(lv)
lv <- sim(lv)
plot(lv)
results <- out(lv)

## Not run: 
##D data(conway)    # Conway's game of life
##D init(conway) <- matrix(0, 10, 10)
##D times(conway) <-  1:100
##D conway <- editInit(conway) # enter some "1"
##D sim(conway, animate=TRUE, delay=100)
## End(Not run)

## (2) Define and run your own  simecol model ==========================

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

lv <- sim(lv)
plot(lv)

## (3) The same in matrix notation; this allows generalization      ====
##     to multi-species interaction models with > 2 species.        ====

LVPP <- new("odeModel",
  main = function(t, n, parms) {
    with(parms, {
      dn <- r * n  + n * (A %*% n)
      list(c(dn))
    })
  },
  parms = list(
    # growth/death rates
    r = c(k1 = 0.2, k3 = -0.2),
    # interaction matrix
    A = matrix(c(0.0, -0.2,
                 0.2,  0.0),
                 nrow = 2, ncol = 2, byrow=TRUE)
  ),
  times  = c(from = 0, to = 100, by = 0.5),
  init   = c(N1 = 0.5, N2 = 1),
  solver = "lsoda"
)

plot(sim(LVPP))


## (4) Additional resources ============================================

## Not run: 
##D ## open the directory with source code of demo
##D browseURL(paste(system.file(package="simecol"), "/demo", sep=""))
##D 
##D ## run demo
##D demo(jss)
##D 
##D ## open the directory with R sourcecode examples
##D browseURL(paste(system.file(package="simecol"), "/doc/examples", sep=""))
##D 
##D ## show package vignette with introductory article
##D vignette("a-simecol-introduction")
##D vignette("b-simecol-howtos")
##D ## edit a vignette
##D # edit(vignette("a-simecol-introduction"))
##D # edit(vignette("b-simecol-howtos"))
##D 
##D ## Open Project Homepage
##D browseURL("http://www.simecol.de")
## End(Not run)

## How to cite package simecol in publications
citation("simecol")



