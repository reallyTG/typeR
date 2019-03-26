library(wSVM)


### Name: wsvm.predict
### Title: Predict new test set using wsvm function and compute error rate
### Aliases: wsvm.predict
### Keywords: svm

### ** Examples


# generate a simulation data set using mixture example(page 17, Friedman et al. 2000)

svm.data <- simul.wsvm(set.seeds = 123)
X <- svm.data$X
Y <- svm.data$Y
new.X <- svm.data$new.X
new.Y <- svm.data$new.Y

# run Weighted K-means clustering SVM with boosting algorithm
model <- wsvm(X, Y, c.n = rep(1/ length(Y),length(Y)))

# predict the model and compute an error rate. 
pred <- wsvm.predict(X,Y, new.X, new.Y, model)

Error.rate(pred$predicted.Y, Y)

# add boost algorithm

boo <- wsvm.boost(X, Y, new.X, new.Y, c.n = rep(1/ length(Y),length(Y)), 
    B = 50, kernel.type = list(type = "rbf", par= 0.5), C = 4, 
    eps = 1e-10, plotting = TRUE)
boo



