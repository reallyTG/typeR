library(PBSmapping)


### Name: fixPOS
### Title: Fix the POS Column of a PolySet
### Aliases: fixPOS
### Keywords: manip

### ** Examples

local(envir=.PBSmapEnv,expr={
  #--- create a PolySet with broken POS numbering
  polys <- data.frame(PID = c(rep(1, 10), rep(2, 10)),
    POS = c(seq(2, 10, length = 10), seq(10, 2, length = 10)),
    X = c(rep(1, 10), rep(1, 10)),
    Y = c(rep(1, 10), rep(1, 10)))
  #--- fix the POS numbering
  polys <- fixPOS(polys)
  #--- print the results
  print(polys)
})



