library(deSolve)


### Name: deSolve-internal
### Title: Internal deSolve Functions
### Aliases: timestep
### Keywords: internal

### ** Examples

###################################################
### This example shows how to retrieve information 
### about the used time steps.
###################################################

## a function closure  ('lexical scoping')
modelClosure <- function(t0) {
  t.old <- t.act <- t0
  function(t, y, parms) {
    t.old  <<- t.act
    t.act  <<- t
    cat(t, "\t", t - t.old, "\n")
    with (as.list(c(y, parms)), {
      dP <- a * P      -  b * P * K
      dK <- b * P * K  -  c * K
      list(c(dP, dK))
    })
  }
}

model <- modelClosure(0) # initialization

parms <- c(a = 0.1, b = 0.1, c = 0.1)

y <- c(P = 1, K = 2)

out <- ode(y = y, func = model, times = c(0, 2),
 parms = parms, method = "lsoda")

ls() # prove that t.old and t.new are local within 'model' 



