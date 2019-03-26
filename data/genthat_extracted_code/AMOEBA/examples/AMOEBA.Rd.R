library(AMOEBA)


### Name: AMOEBA
### Title: A Multidirectional Optimum Ecotope-Based Algorithm
### Aliases: AMOEBA
### Keywords: spatial cluster

### ** Examples

####################
##### Shiny App
# Visit: http://amoeba-spatial-cluster.shinyapps.io/AMOEBA/

####################
##### R App
require(AMOEBA)

### Columbus OH spatial analysis data set (spdep package)
data(columbus)
require(maptools)
map<-readShapePoly(system.file('etc/shapes/columbus.shp',package='spdep')[1])

### Application of AMOEBA
res<-AMOEBA(columbus$CRIME,col.gal.nb,1,1)

### Plot
color<-rev(rainbow(length(table(res)),start=0,end=2/6))
plot(map,col=color[as.factor(res)])
title('Clustering of crimes at Columbus (OH)')
names<-c('\nLow','\nMedium','\nHigh')
require(plotrix)
color.legend(map@bbox[1,1],map@bbox[2,1]-0.2,map@bbox[1,2],map@bbox[2,1]-0.4,names,color,align='rb')



