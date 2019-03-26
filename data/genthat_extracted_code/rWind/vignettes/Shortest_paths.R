## ---- echo=FALSE---------------------------------------------------------
suppressPackageStartupMessages(library(rWind))
suppressPackageStartupMessages(library(raster))
suppressPackageStartupMessages(library(gdistance))
suppressPackageStartupMessages(library(lubridate))
foo <- packageDescription("rWind")

## ---- eval=FALSE---------------------------------------------------------
#  # use install.packages() if some is not installed
#  # and you can install the latest development version using the command
#  # devtools::install_github("jabiologo/rWind")
#  library(rWind)
#  library(raster)
#  library(gdistance)

## ---- echo=FALSE---------------------------------------------------------
w <- readRDS("w.rds")

## ---- eval=FALSE---------------------------------------------------------
#  w <- wind.dl(2015, 2, 12, 12, -7, -4, 34.5, 37.5)

## ------------------------------------------------------------------------
wind_layer <- wind2raster(w)

## ------------------------------------------------------------------------
Conductance<-flow.dispersion(wind_layer)

## ------------------------------------------------------------------------
AtoB<- shortestPath(Conductance, 
                    c(-5.5, 37), c(-5.5, 35), output="SpatialLines")
BtoA<- shortestPath(Conductance, 
                    c(-5.5, 35), c(-5.5, 37), output="SpatialLines")

## ---- fig.width = 7, fig.height = 6.5, eval=FALSE------------------------
#  library(fields)
#  library(shape)
#  library(rworldmap)
#  
#  image.plot(wind_layer$wind.speed, main="least cost paths by wind direction and speed",
#       col=terrain.colors(10), xlab="Longitude", ylab="Lattitude", zlim=c(0,7))
#  
#  lines(getMap(resolution = "low"), lwd=4)
#  
#  points(-5.5, 37, pch=19, cex=3.4, col="red")
#  points(-5.5, 35, pch=19, cex=3.4, col="blue")
#  
#  lines(AtoB, col="red", lwd=4, lty=2)
#  lines(BtoA, col="blue", lwd=4, lty=2)
#  
#  alpha <- arrowDir(w)
#  Arrowhead(w$lon, w$lat, angle=alpha, arr.length = 0.4, arr.type="curved")
#  
#  text(-5.75, 37.25,labels="Spain", cex= 2.5, col="red", font=2)
#  text(-5.25, 34.75,labels="Morocco", cex= 2.5, col="blue", font=2)
#  legend("toprigh", legend = c("From Spain to Morocco", "From Morocco to Spain"),
#      lwd=4 ,lty = 1, col=c("red","blue"), cex=0.9, bg="white")

