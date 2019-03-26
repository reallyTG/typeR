library(itree)


### Name: predict.itree
### Title: Predictions from a Fitted itree Object
### Aliases: predict.itree
### Keywords: tree

### ** Examples

#verbatim from rpart examples:
z.auto <- itree(Mileage ~ Weight, car.test.frame)
predict(z.auto)

fit <- itree(Kyphosis ~ Age + Number + Start, data=kyphosis)
predict(fit, type="prob")   # class probabilities (default)
predict(fit, type="vector") # level numbers
predict(fit, type="class")  # factor
predict(fit, type="matrix") # level number, class frequencies, probabilities

sub <- c(sample(1:50, 25), sample(51:100, 25), sample(101:150, 25))
fit <- itree(Species ~ ., data=iris, subset=sub)
fit
table(predict(fit, iris[-sub,], type="class"), iris[-sub, "Species"])



