library(BSDA)


### Name: Indian
### Title: Educational attainment versus per capita income and poverty rate
###   for American indians living on reservations
### Aliases: Indian
### Keywords: datasets

### ** Examples


par(mfrow = c(1, 2))
plot(`per capita income` ~ `percent high school`, data = Indian, 
     xlab = "Percent high school graudates", ylab = "Per capita income")
plot(`poverty rate` ~ `percent high school`, data = Indian, 
     xlab = "Percent high school graudates", ylab = "Percent poverty")
par(mfrow = c(1, 1))




