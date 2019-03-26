library(ahaz)


### Name: plot.tune.ahazpen
### Title: Plot a tune.ahazpen object
### Aliases: plot.tune.ahazpen
### Keywords: hplot

### ** Examples

data(sorlie)

# Break ties
set.seed(10101)
time <- sorlie$time+runif(nrow(sorlie))*1e-2

# Survival data + covariates
surv <- Surv(time,sorlie$status)
X <- as.matrix(sorlie[,3:ncol(sorlie)])

# Do 10 fold cross-validation
set.seed(10101)
tune.fit <- tune.ahazpen(surv, X, penalty="lasso",
              dfmax=50, tune = cv.control(nfolds=10))
plot(tune.fit)




