library(SDMTools)


### Name: Scalebar
### Title: Scalebar for Projected Maps
### Aliases: Scalebar

### ** Examples

#create a simple object of class 'asc'
tasc = as.asc(matrix(1:50,nr=50,nc=50)); print(tasc)

#plot the image
image(tasc,axes=FALSE,ann=FALSE)

#add a distance scalebar
Scalebar(x=5,y=5,distance=20) #show values in km
Scalebar(x=5,y=10,distance=20,unit='m',scale=1000) #show values in meters



