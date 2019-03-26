library(itree)


### Name: xpred.itree
### Title: Return Cross-Validated Predictions
### Aliases: xpred.itree
### Keywords: tree

### ** Examples

#rpart's example:
fit <- itree(Mileage ~ Weight, car.test.frame)
xmat <- xpred.itree(fit)
xerr <- (xmat - car.test.frame$Mileage)^2
apply(xerr, 2, sum)   # cross-validated error estimate

# approx same result as rel. error from printcp(fit)
apply(xerr, 2, sum)/var(car.test.frame$Mileage) 
printcp(fit)



