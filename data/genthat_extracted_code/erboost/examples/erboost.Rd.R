library(erboost)


### Name: erboost
### Title: ER-Boost Expectile Regression Modeling
### Aliases: erboost erboost.more erboost.fit
### Keywords: models nonlinear survival nonparametric tree

### ** Examples


N <- 200
X1 <- runif(N)
X2 <- 2*runif(N)
X3 <- ordered(sample(letters[1:4],N,replace=TRUE),levels=letters[4:1])
X4 <- factor(sample(letters[1:6],N,replace=TRUE))
X5 <- factor(sample(letters[1:3],N,replace=TRUE))
X6 <- 3*runif(N)
mu <- c(-1,0,1,2)[as.numeric(X3)]

SNR <- 10 # signal-to-noise ratio
Y <- X1**1.5 + 2 * (X2**.5) + mu
sigma <- sqrt(var(Y)/SNR)
Y <- Y + rnorm(N,0,sigma)

# introduce some missing values
X1[sample(1:N,size=50)] <- NA
X4[sample(1:N,size=30)] <- NA

data <- data.frame(Y=Y,X1=X1,X2=X2,X3=X3,X4=X4,X5=X5,X6=X6)

# fit initial model
erboost1 <- erboost(Y~X1+X2+X3+X4+X5+X6,         # formula
    data=data,                   # dataset
    var.monotone=c(0,0,0,0,0,0), # -1: monotone decrease,
                                 # +1: monotone increase,
                                 #  0: no monotone restrictions
    distribution=list(name="expectile",alpha=0.5),
                                 # expectile
    n.trees=3000,                # number of trees
    shrinkage=0.005,             # shrinkage or learning rate,
                                 # 0.001 to 0.1 usually work
    interaction.depth=3,         # 1: additive model, 2: two-way interactions, etc.
    bag.fraction = 0.5,          # subsampling fraction, 0.5 is probably best
    train.fraction = 0.5,        # fraction of data for training,
                                 # first train.fraction*N used for training
    n.minobsinnode = 10,         # minimum total weight needed in each node
    cv.folds = 5,                # do 5-fold cross-validation
    keep.data=TRUE,              # keep a copy of the dataset with the object
    verbose=TRUE)                # print out progress


# check performance using a 50% heldout test set
best.iter <- erboost.perf(erboost1,method="test")
print(best.iter)

# check performance using 5-fold cross-validation
best.iter <- erboost.perf(erboost1,method="cv")
print(best.iter)

# plot the performance
# plot variable influence
summary(erboost1,n.trees=1)         # based on the first tree
summary(erboost1,n.trees=best.iter) # based on the estimated best number of trees

# make some new data
N <- 20
X1 <- runif(N)
X2 <- 2*runif(N)
X3 <- ordered(sample(letters[1:4],N,replace=TRUE))
X4 <- factor(sample(letters[1:6],N,replace=TRUE))
X5 <- factor(sample(letters[1:3],N,replace=TRUE))
X6 <- 3*runif(N)
mu <- c(-1,0,1,2)[as.numeric(X3)]

Y <- X1**1.5 + 2 * (X2**.5) + mu + rnorm(N,0,sigma)

data2 <- data.frame(Y=Y,X1=X1,X2=X2,X3=X3,X4=X4,X5=X5,X6=X6)

# predict on the new data using "best" number of trees
# f.predict generally will be on the canonical scale
f.predict <- predict.erboost(erboost1,data2,best.iter)

# least squares error
print(sum((data2$Y-f.predict)^2))

# create marginal plots
# plot variable X1 after "best" iterations
plot.erboost(erboost1,1,best.iter)
# contour plot of variables 1 and 3 after "best" iterations
plot.erboost(erboost1,c(1,3),best.iter)

# do another 20 iterations
erboost2 <- erboost.more(erboost1,20,
                 verbose=FALSE) # stop printing detailed progress



