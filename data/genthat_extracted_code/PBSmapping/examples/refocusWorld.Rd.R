library(PBSmapping)


### Name: refocusWorld
### Title: Refocus the 'worldLL'/'worldLLhigh' Data Sets
### Aliases: refocusWorld
### Keywords: manip

### ** Examples

local(envir=.PBSmapEnv,expr={
  oldpar = par(no.readonly=TRUE)
  #--- load appropriate data
  data(worldLL,envir=.PBSmapEnv)
  #--- set limits
  xlim <- c(-100,25)
  ylim <- c(0,90)
  #--- refocus and plot the world
  polys <- refocusWorld(worldLL, xlim, ylim)
  plotMap(polys, xlim, ylim)
  par(oldpar)
})



