library(LilRhino)


### Name: Feed_Reduction
### Title: A Function for converting data into approximations of
###   probability space.
### Aliases: Feed_Reduction

### ** Examples

## No test: 
#Feed Network Testing
library(keras)
dat <- keras::dataset_mnist()
X_train = array_reshape(dat$train$x/255, c(nrow(dat$train$x/255), 784))
y_train = dat$train$y
X_test = array_reshape(dat$test$x/255, c(nrow(dat$test$x/255), 784))
y_test = dat$test$y

Reduced_Data2 = Feed_Reduction(X_train, y_train, X_test,
                              val_split = .3, nodes = 350,
                              30, 50, verbose = 1)

library(e1071)
names(Reduced_Data2$test) = names(Reduced_Data2$train)
newdat = as.data.frame(cbind(rbind(Reduced_Data2$train, Reduced_Data2$test), c(y_train, y_test)))
colnames(newdat) = c(paste("V", c(1:11), sep = ""))
mod = svm(V11~., data = newdat, subset = c(1:60000),
         kernel = 'linear', cost = 1, type = 'C-classification')
preds = predict(mod, newdat[60001:70000,-11])
sum(preds == y_test)/10000
## End(No test)



