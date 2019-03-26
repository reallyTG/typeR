library(GWmodel)


### Name: EWHP
### Title: House price data set (DataFrame) in England and Wales
### Aliases: EWHP ewhp
### Keywords: data,house price

### ** Examples

###
data(EWHP)
head(ewhp)
houses.spdf <- SpatialPointsDataFrame(ewhp[, 1:2], ewhp)
 ####Get the border of England and Wales
data(EWOutline)
plot(ewoutline)
plot(houses.spdf, add = TRUE, pch = 16)



