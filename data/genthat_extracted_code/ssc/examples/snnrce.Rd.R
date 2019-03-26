library(ssc)


### Name: snnrce
### Title: SNNRCE method
### Aliases: snnrce

### ** Examples


library(ssc)

## Load Wine data set
data(wine)

cls <- which(colnames(wine) == "Wine")
x <- wine[, -cls] # instances without classes
y <- wine[, cls] # the classes
x <- scale(x) # scale the attributes

## Prepare data
set.seed(20)
# Use 50% of instances for training
tra.idx <- sample(x = length(y), size = ceiling(length(y) * 0.5))
xtrain <- x[tra.idx,] # training instances
ytrain <- y[tra.idx]  # classes of training instances
# Use 70% of train instances as unlabeled set
tra.na.idx <- sample(x = length(tra.idx), size = ceiling(length(tra.idx) * 0.7))
ytrain[tra.na.idx] <- NA # remove class information of unlabeled instances

# Use the other 50% of instances for inductive testing
tst.idx <- setdiff(1:length(y), tra.idx)
xitest <- x[tst.idx,] # testing instances
yitest <- y[tst.idx] # classes of testing instances

## Example: Training from a set of instances with 1-NN as base classifier.
m1 <- snnrce(x = xtrain, y = ytrain,  dist = "Euclidean")
pred1 <- predict(m1, xitest)
table(pred1, yitest)

## Example: Training from a distance matrix with 1-NN as base classifier.
dtrain <- proxy::dist(x = xtrain, method = "euclidean", by_rows = TRUE)
m2 <- snnrce(x = dtrain, y = ytrain, x.inst = FALSE)
ditest <- proxy::dist(x = xitest, y = xtrain[m2$instances.index,],
                      method = "euclidean", by_rows = TRUE)
pred2 <- predict(m2, ditest)
table(pred2, yitest)




