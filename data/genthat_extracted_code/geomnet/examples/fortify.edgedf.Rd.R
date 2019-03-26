library(geomnet)


### Name: fortify.edgedf
### Title: Function for converting a network edge list in data frame form
###   into the correct format for use with geomnet
### Aliases: fortify.edgedf

### ** Examples


data(blood)
fortify(as.edgedf(blood$edges), blood$vertices)
fortify(as.edgedf(blood$edges), blood$vertices, group = "Ethnicity")



