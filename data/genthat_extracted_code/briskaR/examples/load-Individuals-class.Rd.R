library(briskaR)


### Name: loadIndividuals
### Title: Wrapper function loadIndividuals
### Aliases: loadIndividuals

### ** Examples

 
library(sp)
data(maize_65)
# simulate 2 individuals coordinates (SpatialPoints object) and data:
coordinates <- SpatialPoints(matrix(c(468232.1,6259993,464848.8,6260483),ncol=2,byrow=TRUE),
proj4string=CRS("+init=epsg:2154"))
df <- data.frame("dob"=c(1,8),"life_duration"=c(20,20),
           "toxic_threshold"=c(15,15),row.names = c(1,2))
# create an Indiviudals object from previous data
ind <- loadIndividuals(objectL=maize.landscape,sp=coordinates,data=df,mintime=1,maxtime=61)
plot(maize.landscape,ind)



