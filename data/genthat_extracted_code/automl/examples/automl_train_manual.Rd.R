library(automl)


### Name: automl_train_manual
### Title: automl_train_manual
### Aliases: automl_train_manual

### ** Examples

##REGRESSION (predict Sepal.Length given other Iris parameters)
data(iris)
xmat <- cbind(iris[,2:4], as.numeric(iris$Species))
ymat <- iris[,1]
#with gradient descent
amlmodel <- automl_train_manual(Xref = xmat, Yref = ymat,
                                hpar = list(learningrate = 0.01,
                                            numiterations = 30,
                                            minibatchsize = 2^2))
## Not run: 
##D #with PSO
##D amlmodel <- automl_train_manual(Xref = xmat, Yref = ymat,
##D                                 hpar = list(modexec = 'trainwpso',
##D                                             numiterations = 30,
##D                                             psopartpopsize = 50))
##D #with PSO and custom cost function
##D f <- 'J=abs((y-yhat)/y)'
##D f <- c(f, 'J=sum(J[!is.infinite(J)],na.rm=TRUE)')
##D f <- c(f, 'J=(J/length(y))')
##D f <- paste(f, collapse = ';')
##D amlmodel <- automl_train_manual(Xref = xmat, Yref = ymat,
##D                                 hpar = list(modexec = 'trainwpso',
##D                                             numiterations = 30,
##D                                             psopartpopsize = 50,
##D                                             costcustformul = f))
##D 
##D ##CLASSIFICATION (predict Species given other Iris parameters)
##D data(iris)
##D xmat = iris[,1:4]
##D lab2pred <- levels(iris$Species)
##D lghlab <- length(lab2pred)
##D iris$Species <- as.numeric(iris$Species)
##D ymat <- matrix(seq(from = 1, to = lghlab, by = 1), nrow(xmat), lghlab, byrow = TRUE)
##D ymat <- (ymat == as.numeric(iris$Species)) + 0
##D #with gradient descent and 2 hidden layers
##D amlmodel <- automl_train_manual(Xref = xmat, Yref = ymat,
##D                                 hpar = list(layersshape = c(10, 10, 0),
##D                                             layersacttype = c('tanh', 'relu', 'sigmoid'),
##D                                             layersdropoprob = c(0, 0, 0)))
##D #with gradient descent and no hidden layer (logistic regression)
##D amlmodel <- automl_train_manual(Xref = xmat, Yref = ymat,
##D                                 hpar = list(layersshape = c(0),
##D                                             layersacttype = c('sigmoid'),
##D                                             layersdropoprob = c(0)))
##D #with PSO and softmax
##D amlmodel <- automl_train_manual(Xref = xmat, Yref = ymat,
##D                                 hpar = list(modexec = 'trainwpso',
##D                                             layersshape = c(10, 0),
##D                                             layersacttype = c('relu', 'softmax'),
##D                                             layersdropoprob = c(0, 0),
##D                                             numiterations = 50,
##D                                             psopartpopsize = 50))
## End(Not run)



