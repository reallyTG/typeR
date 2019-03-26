library(itree)


### Name: car.test.frame
### Title: Automobile Data from 'Consumer Reports' 1990
### Aliases: car.test.frame
### Keywords: datasets

### ** Examples

#just as in rpart
z.auto <- itree(Mileage ~ Weight, car.test.frame)
summary(z.auto)



