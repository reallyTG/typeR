library(automl)


### Name: automl_predict
### Title: automl_predict
### Aliases: automl_predict

### ** Examples

##REGRESSION (predict Sepal.Length given other parameters)
data(iris)
xmat <- as.matrix(cbind(iris[,2:4], as.numeric(iris$Species)))
ymat <- iris[,1]
amlmodel <- automl_train_manual(Xref = xmat, Yref = ymat,
 hpar = list(modexec = 'trainwpso', verbose = FALSE))
res <- cbind(ymat, automl_predict(model = amlmodel, X = xmat))
colnames(res) <- c('actual', 'predict')
head(res)
#
## Not run: 
##D ##CLASSIFICATION (predict Species given other Iris parameters)
##D data(iris)
##D xmat = iris[,1:4]
##D lab2pred <- levels(iris$Species)
##D lghlab <- length(lab2pred)
##D iris$Species <- as.numeric(iris$Species)
##D ymat <- matrix(seq(from = 1, to = lghlab, by = 1), nrow(xmat),
##D  lghlab, byrow = TRUE)
##D ymat <- (ymat == as.numeric(iris$Species)) + 0
##D amlmodel <- automl_train_manual(Xref = xmat, Yref = ymat,
##D  hpar = list(modexec = 'trainwpso', verbose = FALSE))
##D res <- cbind(ymat, round(automl_predict(model = amlmodel, X = xmat)))
##D colnames(res) <- c(paste('act',lab2pred, sep = '_'),
##D  paste('pred',lab2pred, sep = '_'))
##D head(res)
## End(Not run)



