library(msgl)


### Name: predict.msgl
### Title: Predict
### Aliases: predict.msgl

### ** Examples

data(SimData)

x.1 <- x[1:50,]
x.2 <- x[51:100,]

classes.1 <- classes[1:50]
classes.2 <- classes[51:100]

lambda <- msgl::lambda(x.1, classes.1, alpha = .5, d = 50, lambda.min = 0.05)
fit <- msgl::fit(x.1, classes.1, alpha = .5, lambda = lambda)

# Predict classes of new data set x.2
res <- predict(fit, x.2)

# The error rates of the models
Err(res, classes = classes.2)

# The predicted classes for model 20
res$classes[,20]




