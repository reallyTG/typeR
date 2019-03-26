library(PBSmapping)


### Name: makeProps
### Title: Make Polygon Properties
### Aliases: makeProps
### Keywords: manip

### ** Examples

local(envir=.PBSmapEnv,expr={
  #--- create a PolyData object
  pd <- data.frame(PID=1:10, Z=1:10)

  #--- using 3 intervals, create a column named `col' and populate it with
  #--- the supplied values
  makeProps(pdata=pd, breaks=3, propName="col", propVals=c(1:3))
})



