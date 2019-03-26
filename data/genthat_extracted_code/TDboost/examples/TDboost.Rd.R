library(TDboost)


### Name: TDboost
### Title: TDboost Tweedie Regression Modeling
### Aliases: TDboost TDboost.more TDboost.fit
### Keywords: models nonlinear survival nonparametric tree

### ** Examples

data(FHT)
# training on data1
TDboost1 <- TDboost(Y~X1+X2+X3+X4+X5+X6,         # formula
    data=data1,                   # dataset
    var.monotone=c(0,0,0,0,0,0), # -1: monotone decrease,
                                 # +1: monotone increase,
                                 #  0: no monotone restrictions
    distribution=list(name="EDM",alpha=1.5),
                                 # specify Tweedie index parameter
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

# print out the optimal iteration number M
best.iter <- TDboost.perf(TDboost1,method="test")
print(best.iter)

# check performance using 5-fold cross-validation
best.iter <- TDboost.perf(TDboost1,method="cv")
print(best.iter)

# plot the performance
# plot variable influence
summary(TDboost1,n.trees=1)         # based on the first tree
summary(TDboost1,n.trees=best.iter) # based on the estimated best number of trees

# making prediction on data2
f.predict <- predict.TDboost(TDboost1,data2,best.iter)

# least squares error
print(sum((data2$Y-f.predict)^2))

# create marginal plots
# plot variable X1 after "best" iterations
plot.TDboost(TDboost1,1,best.iter)
# contour plot of variables 1 and 3 after "best" iterations
plot.TDboost(TDboost1,c(1,3),best.iter)

# do another 20 iterations
TDboost2 <- TDboost.more(TDboost1,20,
                 verbose=FALSE) # stop printing detailed progress

# fit a gamma model (when alpha = 2.0)
data2 <- data1[data1$Y!=0,]
TDboost3 <- TDboost(Y~X1+X2+X3+X4+X5+X6,         # formula
    data=data2,                   # dataset
    distribution=list(name="EDM",alpha=2.0),
    n.trees=3000, 				 # number of trees
    train.fraction = 0.5,        # fraction of data for training,
    verbose=TRUE)                # print out progress
best.iter2 <- TDboost.perf(TDboost3,method="test")




