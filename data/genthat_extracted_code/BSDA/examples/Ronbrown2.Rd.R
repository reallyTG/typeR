library(BSDA)


### Name: Ronbrown2
### Title: Oceanography data obtained at site 2 by scientist aboard the
###   ship Ron Brown
### Aliases: Ronbrown2
### Keywords: datasets

### ** Examples


plot(salinity ~ depth, data = Ronbrown2)
model <- lm(salinity ~ depth, data = Ronbrown2)
summary(model)
plot(model, which = 1)
rm(model)




