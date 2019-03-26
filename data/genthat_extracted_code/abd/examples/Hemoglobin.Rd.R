library(abd)


### Name: Hemoglobin
### Title: Hemoglobin Levels in High Altitude Populations
### Aliases: Hemoglobin
### Keywords: datasets

### ** Examples

str(Hemoglobin)

xyplot(relative.frequency ~ hemoglobin | group, Hemoglobin,
  type ='h', lwd=4, layout=c(1,4))



