library(varSelRF)


### Name: varSelRF
### Title: Variable selection from random forests using OOB error
### Aliases: varSelRF
### Keywords: tree classif

### ** Examples

set.seed(1)
x <- matrix(rnorm(25 * 30), ncol = 30)
colnames(x) <- paste("v", 1:30, sep = "")
x[1:10, 1:2] <- x[1:10, 1:2] + 1
x[1:4, 5] <- x[1:4, 5] - 1.5
x[5:10, 8] <- x[5:10, 8] + 1.4 

cl <- factor(c(rep("A", 10), rep("B", 15)))  
rf.vs1 <- varSelRF(x, cl, ntree = 500, ntreeIterat = 300,
                   vars.drop.frac = 0.2)
rf.vs1
plot(rf.vs1)


## Note you can use tiny vars.drop.frac
## though you'll rarely want this
rf.vs1tiny <- varSelRF(x, cl, ntree = 500, ntreeIterat = 300,
                   vars.drop.frac = 0.01)

#### Using the final, fitted model to predict other data

## Simulate new data
set.seed(2)
x.new <- matrix(rnorm(25 * 30), ncol = 30)
colnames(x.new) <- paste("v", 1:30, sep = "")
x.new[1:10, 1:2] <- x.new[1:10, 1:2] + 1
x.new[1:10, 5] <- x.new[1:10, 5] - 0.5


## Fit with whole.range = FALSE and keep.forest = TRUE
set.seed(3)
rf.vs2 <- varSelRF(x, cl, ntree = 3000, ntreeIterat = 2000,
                   vars.drop.frac = 0.3, whole.range = FALSE,
                   keep.forest = TRUE)


## To obtain predictions from a data set, you must specify the
## same variables as those used in the final model

rf.vs2$selected.vars


predict(rf.vs2$rf.model,
        newdata = subset(x.new, select = rf.vs2$selected.vars))
predict(rf.vs2$rf.model,
        newdata = subset(x.new, select = rf.vs2$selected.vars),
        type = "prob")


## If you had not kept the forest (keep.forest) you could also try
randomForest(y = cl, x = subset(x, select = rf.vs2$selected.vars),
             ntree = rf.vs2$ntreeIterat,
             xtest = subset(x, select = rf.vs2$selected.vars))$test

## but here the forest is built new (with only the selected variables)
## so results need not be the same



## CAUTION: You will NOT want this (these are similar to resubstitution
##   predictions)

predict(rf.vs2$rf.model, newdata = subset(x, select = rf.vs2$selected.vars))

## nor these (read help of predict.randomForest for why these
## predictions are different from those from previous command)

predict(rf.vs2$rf.model)





