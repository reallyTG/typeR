library(kml3d)


### Name: kml3d-package
### Title: ~ Overview: KmL3D, K-means for joint Longitudinal data ~
### Aliases: kml3d-package [,ParChoice-method [<-,ParChoice-method
### Keywords: package dplot iplot chron spatial classif cluster
###   nonparametric ts robust models

### ** Examples

## No test: 
### 1. Data Preparation
data(pregnandiol)
names(pregnandiol)
cld3dPregTemp <- cld3d(pregnandiol,timeInData=list(temp=1:30*2,preg=1:30*2+1))

### 2. Building "optimal" clusteration (with only 2 redrawings)
###    Real analysis needs at least 20 redrawings
kml3d(cld3dPregTemp,3:5,nbRedrawing=2,toPlot="both")

### 3. Exporting results
try(choice(cld3dPregTemp))

### 4. Visualizing in 3D
plotMeans3d(cld3dPregTemp,4)
## End(No test)



