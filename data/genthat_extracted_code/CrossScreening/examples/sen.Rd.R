library(CrossScreening)


### Name: sen
### Title: Sensivity analysis with signed score test
### Aliases: sen

### ** Examples


require(CrossScreening)
data(lead)
d.lead <- lead$exposed[-21] - lead$control[-21]
sen(d.lead, gamma = c(1, 2, 3, 4, 5, 6))




