library(GWmodel)


### Name: GeorgiaCounties
### Title: Georgia counties data (SpatialPolygonsDataFrame)
### Aliases: Gedu.counties
### Keywords: datasets

### ** Examples

data(GeorgiaCounties)
plot(Gedu.counties)
data(Georgia)
coords <- cbind(Gedu.df$X, Gedu.df$Y)
educ.spdf <- SpatialPointsDataFrame(coords, Gedu.df)
plot(educ.spdf, add=TRUE)




