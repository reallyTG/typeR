library(GWmodel)


### Name: Georgia
### Title: Georgia census data set (csv file)
### Aliases: Georgia Gedu.df
### Keywords: datasets

### ** Examples

data(Georgia)
ls()
coords <- cbind(Gedu.df$X, Gedu.df$Y)
educ.spdf <- SpatialPointsDataFrame(coords, Gedu.df)
spplot(educ.spdf, names(educ.spdf)[4:10])



