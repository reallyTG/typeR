library(climatol)


### Name: dahgrid
### Title: Interpolation of normalized homogeneous data on a predefined
###   grid
### Aliases: dahgrid
### Keywords: datagen

### ** Examples

if(requireNamespace("ncdf4") & requireNamespace("sp")) {
  #Set a temporal working directory and write input files:
  wd <- tempdir()
  wd0 <- setwd(wd)
  data(pcp_results) #Load homogenization data
  #Write homogenization results as expected by the dahgrid function:
  save(dah,dat,est.c,ini,nd,ndec,ne,nei,nm,std,x,file='pcp_2001-2010.rda')
  #Now run the example:
  grd <- expand.grid(x=seq(2.9,3.3,.1),y=seq(39.5,39.7,.1))
  sp::coordinates(grd) <- ~ x+y
  dahgrid('pcp',2001,2010,grid=grd)
  #Return to user's working directory:
  setwd(wd0)
  #Input and output files can be found in directory:
  print(wd)
}



