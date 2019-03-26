library(ITGM)


### Name: firstsMeasurements
### Title: First Measurements per Group
### Aliases: firstsMeasurements

### ** Examples

dtf = data.frame(
grupo = c(1,2,3,4,1,2,3,4),
medicoes= c(10,20,30,40,5,30,1,52))
firstsMeasurements(dtf, group = "grupo", age = "medicoes")



