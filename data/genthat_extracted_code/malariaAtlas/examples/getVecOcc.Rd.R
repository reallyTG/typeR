library(malariaAtlas)


### Name: getVecOcc
### Title: Download Vector Occurrence points from the MAP database
###   'getVecOcc' downloads all publicly available vector occurrence points
###   for a specified country (or countries) and returns this as a
###   dataframe. 'country' and 'ISO' refer to countries and a lower-level
###   administrative regions such as French Guiana.
### Aliases: getVecOcc

### ** Examples

# Download vector occurrence data for Brazil and map the locations using autoplot.vector.points
## No test: 
Brazil_vec <- getVecOcc(country = "Brazil")
autoplot(Brazil_vec)

# Download vector data for Madagascar and map the locations using autoplot
Madagascar_vec <- getVecOcc(ISO = "MDG", species = "All")
autoplot(Madagascar_vec)

# Subset by extent.
extent_vec <- getVecOcc(extent = matrix(c(100,13,110,18), nrow = 2), species = 'all')
## End(No test)





