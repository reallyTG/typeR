library(PBSmapping)


### Name: appendPolys
### Title: Append a Two-Column Matrix to a PolySet
### Aliases: appendPolys
### Keywords: manip

### ** Examples

local(envir=.PBSmapEnv,expr={
  #--- create two simple matrices
  a <- matrix(data=c(0,0,1,0,1,1,0,1),ncol=2,byrow=TRUE);
  b <- matrix(data=c(2,2,3,2,3,3,2,3), ncol=2,byrow=TRUE);
  #--- build a PolySet from them
  polys <- appendPolys(NULL, a);
  polys <- appendPolys(polys, b);
  #--- print the result
  print (polys);
})



