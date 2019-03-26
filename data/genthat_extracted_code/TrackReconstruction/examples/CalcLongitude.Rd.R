library(TrackReconstruction)


### Name: CalcLongitude
### Title: Calculate Longitude
### Aliases: CalcLongitude
### Keywords: ~kwd1 ~kwd2

### ** Examples

#Longitude of Los Angeles starting in Manhattan
Long <- CalcLongitude(40.7697,0.5943228,-73.9735,3938000,-1.507516)
#transform to degrees
Long*360/(2*pi)

##Use results of CalcLatitude
Lat<-CalcLatitude (40.7697,3938000,-1.507516)
Long <- CalcLongitude(40.7697,Lat,-73.9735,3938000,-1.507516)
#transform to degrees
Long*360/(2*pi)




