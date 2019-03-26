library(MOEADr)


### Name: moead
### Title: MOEA/D
### Aliases: moead

### ** Examples

## Prepare a test problem composed of minimization of the (shifted)
## sphere and Rastrigin functions
sphere     <- function(x){sum((x + seq_along(x) * 0.1) ^ 2)}
rastringin <- function(x){
                x.shift <- x - seq_along(x) * 0.1
                sum((x.shift) ^ 2 - 10 * cos(2 * pi * x.shift) + 10)}
problem.sr <- function(X){
                t(apply(X, MARGIN = 1,
                FUN = function(X){c(sphere(X), rastringin(X))}))}


## Set the input parameters for the moead() routine
## This reproduces the Original MOEA/D of Zhang and Li (2007)
## (with a few changes in the computational budget, to make it run faster)
problem   <- list(name       = "problem.sr",
                  xmin       = rep(-1, 30),
                  xmax       = rep(1, 30),
                  m          = 2)
decomp    <- list(name       = "SLD", H = 49) # <-- H = 99 in the original
neighbors <- list(name       = "lambda",
                  T          = 20,
                  delta.p    = 1)
aggfun    <- list(name       = "wt")
variation <- list(list(name  = "sbx",
                       etax  = 20, pc = 1),
                  list(name  = "polymut",
                       etam  = 20, pm = 0.1),
                  list(name  = "truncate"))
update    <- list(name       = "standard", UseArchive = FALSE)
scaling   <- list(name       = "none")
constraint<- list(name       = "none")
stopcrit  <- list(list(name  = "maxiter",
                    maxiter  = 50))      # <-- maxiter = 200 in the original
showpars  <- list(show.iters = "dots",
                  showevery  = 10)
seed      <- 42

## Run MOEA/D
out1 <- moead(preset = NULL,
              problem, decomp, aggfun, neighbors, variation, update,
              constraint, scaling, stopcrit, showpars, seed)

## Examine the output:
summary(out1)

## Alternatively, the standard MOEA/D could also be set up using the
## preset_moead() function. The code below runs the original MOEA/D with
## exactly the same configurations as in Zhang and Li (2007).
## Not run: 
##D   out2 <- moead(preset   = preset_moead("original"),
##D                 problem  = problem,
##D                 showpars = showpars,
##D                 seed     = 42)
##D 
##D   ## Examine the output:
##D   summary(out2)
##D   plot(out2, suppress.pause = TRUE)
## End(Not run)

# Rerun with MOEA/D-DE configuration and AWT scalarization
out3 <- moead(preset   = preset_moead("moead.de"),
              problem  = problem,
              aggfun   = list(name = "awt"),
              stopcrit = list(list(name    = "maxiter",
                                   maxiter = 50)),
              seed    = seed)
plot(out3, suppress.pause = TRUE)



