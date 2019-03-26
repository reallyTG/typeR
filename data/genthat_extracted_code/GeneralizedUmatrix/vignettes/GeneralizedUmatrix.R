## ----setup, include=FALSE------------------------------------------------
library(rgl)
library(GeneralizedUmatrix)
setupKnitr()
knitr::opts_chunk$set(echo = TRUE,
                      fig.align = "center",
                      warning = FALSE,
                      webgl = TRUE,
                      dpi=50,
                      fig.width = 7, 
                      fig.height =7,
                      fig.keep = "all"
                      )

## ----results = "hide"----------------------------------------------------
data("Chainlink")
Data=Chainlink$Data
Cls=Chainlink$Cls
require(DataVisualizations)
DataVisualizations::plot3D(Data,Cls,main='Chainlink dataset')
InputDistances=as.matrix(dist(Data))
res=cmdscale(d=InputDistances, k = 2, eig = TRUE, add = FALSE, x.ret = FALSE)
ProjectedPoints=as.matrix(res$points)
plot(ProjectedPoints,col=Cls)

## ----webGL = TRUE,results = "hide"---------------------------------------
visualization=GeneralizedUmatrix(Data,ProjectedPoints)
plotTopographicMap(visualization$Umatrix,visualization$Bestmatches,nlevels=10)

