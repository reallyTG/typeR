library(rpart)


### Name: car.test.frame
### Title: Automobile Data from 'Consumer Reports' 1990
### Aliases: car.test.frame
### Keywords: datasets

### ** Examples

z.auto <- rpart(Mileage ~ Weight, car.test.frame)
summary(z.auto)



