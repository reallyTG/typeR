library(psych)


### Name: cities
### Title: Distances between 11 US cities
### Aliases: cities city.location
### Keywords: datasets

### ** Examples


data(cities)
city.location[,1] <- -city.location[,1]
#not run
#an overlay map can be added if the package maps is available
#
#
#libary(maps)
#map("usa")
#title("MultiDimensional Scaling of US cities")
#points(city.location)

plot(city.location, xlab="Dimension 1", ylab="Dimension 2",
   main ="Multidimensional scaling of US cities")
city.loc <- cmdscale(cities, k=2) #ask for a 2 dimensional solution  round(city.loc,0) 
city.loc <- -city.loc 
 city.loc <- rescale(city.loc,apply(city.location,2,mean),apply(city.location,2,sd))
points(city.loc,type="n") 
text(city.loc,labels=names(cities))




