library(PBSmapping)


### Name: makeTopography
### Title: Make Topography Data From Freely Available Online Data
### Aliases: makeTopography
### Keywords: manip

### ** Examples

local(envir=.PBSmapEnv,expr={
  oldpar = par(no.readonly=TRUE)
  #--- Example 1: Sample data frame and conversion.
  file <- data.frame(X=c(1,1,2,2),Y=c(3,4,3,4),Z=c(5,6,7,8))
  print(makeTopography(file))

  #--- Example 2: Aleutian Islands bathymetry
  isob <- c(100,500,1000,2500,5000)
  icol <- rgb(0,0,seq(255,100,len=length(isob)),max=255)
  afile <- paste(system.file(package="PBSmapping"),
    "/Extra/aleutian.txt",sep="")
  aleutian <- read.table(afile, header=FALSE, col.names=c("x","y","z"))
  aleutian$x <- aleutian$x - 360
  aleutian$z <- -aleutian$z
  alBathy <- makeTopography(aleutian)
  alCL <- contourLines(alBathy,levels=isob)
  alCP <- convCP(alCL)
  alPoly <- alCP$PolySet
  attr(alPoly,"projection") <- "LL"
  plotMap(alPoly,type="n")
  addLines(alPoly,col=icol)
  data(nepacLL,envir=.PBSmapEnv)
  addPolys(nepacLL,col="gold")
  legend(x="topleft",bty="n",col=icol,lwd=2,legend=as.character(isob))
  par(oldpar)
})



