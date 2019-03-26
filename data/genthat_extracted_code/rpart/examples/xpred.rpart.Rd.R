library(rpart)


### Name: xpred.rpart
### Title: Return Cross-Validated Predictions
### Aliases: xpred.rpart
### Keywords: tree

### ** Examples

fit <- rpart(Mileage ~ Weight, car.test.frame)
xmat <- xpred.rpart(fit)
xerr <- (xmat - car.test.frame$Mileage)^2
apply(xerr, 2, sum)   # cross-validated error estimate

# approx same result as rel. error from printcp(fit)
apply(xerr, 2, sum)/var(car.test.frame$Mileage) 
printcp(fit)



