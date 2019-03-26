library(softmaxreg)


### Name: softmaxReg
### Title: Fit Multi-Layer Softmax Regression or Classification Model
### Aliases: softmaxReg softmaxReg.default softmaxReg.formula
###   predict.softmax summary.softmax

### ** Examples

## Not run: 
##D #### Example 1, Softmax classification with hidden layer and no regularization term
##D 
##D library(softmaxreg)
##D data(iris)
##D x = iris[,1:4]
##D y = iris$Species
##D # Training with hidden layer set 5 units
##D softmax_model = softmaxReg(x, y, hidden = c(5), maxit = 100, type = "class",
##D   algorithm = "adagrad", rate = 0.05, batch = 20)
##D summary(softmax_model)
##D yFitMat = softmax_model$fitted.values
##D yFit = c()
##D for (i in 1:length(y)) {
##D 	yFit = c(yFit, which(yFitMat[i,]==max(yFitMat[i,])))
##D }
##D table(y, yFit)
##D # Caculate AIC and BIC information criterion
##D aic = AIC(softmax_model)
##D bic = BIC(softmax_model)
##D cat("AIC",aic,'\n')
##D cat("BIC",bic,'\n')
##D 
##D # Make new Prediction
##D newdata = iris[1:100,1:4]
##D yPred = predict(softmax_model, newdata)
##D 
##D #### Example 2, Softmax classification with formula and dataframe input
##D 
##D f = formula(Species~.) # formula with succinct expression
##D softmax_model_fm = softmaxReg(f, data = iris, hidden = c(5), maxit = 100, type = "class",
##D   algorithm = "adagrad", rate = 0.05, batch = 20)
##D summary(softmax_model_fm)
##D 
##D #### Example 3: Softmax classfication with L2 regularization
##D 
##D softmax_model_L2 = softmaxReg(x, y, hidden = c(5), maxit = 100, type = "class",
##D   algorithm = "adagrad", L2 = TRUE, penalty = 1e-4, batch = 20)
##D summary(softmax_model_L2)
##D 
##D # Compare Two Model Loss
##D # Note L2 loss value include the ||W||^2 term, larger than loss of previous model
##D loss1 = softmax_model$loss
##D loss2 = softmax_model_L2$loss
##D plot(c(1:length(loss1)), loss1, xlab = "Iteration", ylab = "Loss Function Value",
##D   type = "l", col = "black")
##D lines(c(1:length(loss2)), loss2, col = "red")
##D legend("topright", c("Loss 1: No Regularization", "Loss 2: L2 Regularization"),
##D   col = c("black", "red"),pch = 1)
##D 
##D 
##D #### Example 4: Compare different learning algorithms 'adagrad','sgd',
##D # 'rmsprop', 'momentum', 'nag' (Nesterov Momentum)
##D 
##D library(softmaxreg)
##D data(iris)
##D x = iris[,1:4]
##D y = iris$Species
##D model1 = softmaxReg(x, y, hidden = c(), funName = 'sigmoid', maxit = 100, rang = 0.1,
##D   type = "class", algorithm = "sgd", rate = 0.1, batch = 150)
##D loss1 = model1$loss
##D 
##D model2 = softmaxReg(x, y, hidden = c(), funName = 'sigmoid', maxit = 100, rang = 0.1,
##D   type = "class", algorithm = "adagrad", rate = 0.1, batch = 150)
##D loss2 = model2$loss
##D 
##D model3 = softmaxReg(x, y, hidden = c(), funName = 'sigmoid', maxit = 100, rang = 0.1,
##D   type = "class", algorithm = "rmsprop", rate = 0.1, batch = 150)
##D loss3 = model3$loss
##D 
##D model4 = softmaxReg(x, y, hidden = c(), funName = 'sigmoid', maxit = 100, rang = 0.1,
##D   type = "class", algorithm = "momentum", rate = 0.1, batch = 150)
##D loss4 = model4$loss
##D 
##D model5 = softmaxReg(x, y, hidden = c(), funName = 'sigmoid', maxit = 100, rang = 0.1,
##D   type = "class", algorithm = "nag", rate = 0.1, batch = 150)
##D loss5 = model5$loss
##D 
##D # plot the loss convergence
##D iteration = c(1:length(loss1))
##D plot(iteration, loss1, xlab = "iteration", ylab = "loss", ylim = c(0,
##D    max(loss1,loss2,loss3,loss4,loss5) + 0.01), type = "p", col = "black", cex = 0.7)
##D title("Convergence Comparision Between Learning Algorithms")
##D points(iteration, loss2, col = "red", pch = 2, cex = 0.7)
##D points(iteration, loss3, col = "blue", pch = 3, cex = 0.7)
##D points(iteration, loss4, col = "green", pch = 4, cex = 0.7)
##D points(iteration, loss5, col = "magenta", pch = 5, cex = 0.7)
##D 
##D legend("topright", c("SGD", "Adagrad", "RMSprop", "Momentum", "NAG"),
##D     col = c("black", "red", "blue", "green", "magenta"),pch = c(1,2,3,4,5))
##D 
##D ## Comments: From this experiments we can see that momemtum learning algorithm
##D ## generally converge faster than the standard sgd and its variations
##D 
##D 
##D #### Example 5: Multiple class classification: Read Online Dataset and make document classification
##D 
##D library(softmaxreg)
##D data(word2vec) # default 20 dimension word2vec dataset
##D #### Reuter 50 DataSet UCI Archived Dataset from
##D ## URL: "http://archive.ics.uci.edu/ml/machine-learning-databases/00217/C50.zip"
##D URL = "http://archive.ics.uci.edu/ml/machine-learning-databases/00217/C50.zip"
##D folder = getwd()
##D loadURLData(URL, folder, unzip = TRUE)
##D 
##D ##Training Data
##D subFoler = c('AaronPressman', 'AlanCrosby', 'AlexanderSmith', 'BenjaminKangLim', 'BernardHickey')
##D docTrain = document(path = paste(folder, "\C50train\",subFoler, sep = ""), pattern = 'txt')
##D xTrain = wordEmbed(docTrain, dictionary = word2vec)
##D yTrain = c(rep(1,50), rep(2,50), rep(3,50), rep(4,50), rep(5,50))
##D # Assign labels to 5 different authors
##D 
##D ##Testing Data
##D docTest = document(path = paste(folder, "\C50test\",subFoler, sep = ""), pattern = 'txt')
##D xTest = wordEmbed(docTest, dictionary = word2vec)
##D yTest = c(rep(1,50), rep(2,50), rep(3,50), rep(4,50), rep(5,50))
##D samp = sample(250, 50)
##D xTest = xTest[samp,]
##D yTest = yTest[samp]
##D 
##D ## Train Softmax Classification Model, 20-10-5
##D softmax_model = softmaxReg(xTrain, yTrain, hidden = c(10), maxit = 500, type = "class",
##D     algorithm = "nag", rate = 0.1, L2 = TRUE)
##D summary(softmax_model)
##D yFit = predict(softmax_model, newdata = xTrain)
##D table(yTrain, yFit)
##D 
##D ## Testing
##D yPred = predict(softmax_model, newdata = xTest)
##D table(yTest, yPred)
##D 
##D #### Comments: Increase the word2vec dimensions to 50 or even 100 will help increase
##D #### the capacity of the model and prediction precision
##D 
##D #### Example 6: 'MNIST' dataset HandWritten Digit Recognition
##D ## Download MNIST Dataset from below URL and Gunzip them
##D ## http://yann.lecun.com/exdb/mnist/
##D ## MNIST Data Reading method reuse R code from:
##D ## brendan o'connor - https://gist.github.com/brendano/39760
##D 
##D library(softmaxreg)
##D # Replace with your local path
##D path = "D:\DeepLearning\MNIST\"
##D 
##D ## 10-class classification, Digit 0-9
##D x = load_image_file(paste(path,'train-images-idx3-ubyte', sep=""))
##D y = load_label_file(paste(path,'train-labels-idx1-ubyte', sep=""))
##D xTest = load_image_file(paste(path,'t10k-images-idx3-ubyte',sep=""))
##D yTest = load_label_file(paste(path,'t10k-labels-idx1-ubyte', sep=""))
##D 
##D ## Normalize Input Data
##D x = x/255
##D xTest = xTest/255
##D 
##D ## Compare Convergence Rate of MNIST dataset
##D model1 = softmaxReg(x, y, hidden = c(), funName = 'sigmoid', maxit = 50, rang = 0.1,
##D     type = "class", algorithm = "sgd", rate = 0.01, batch = 100)
##D loss1 = model1$loss
##D model2 = softmaxReg(x, y, hidden = c(), funName = 'sigmoid', maxit = 50, rang = 0.1,
##D     type = "class", algorithm = "adagrad", rate = 0.01, batch = 100)
##D loss2 = model2$loss
##D model3 = softmaxReg(x, y, hidden = c(), funName = 'sigmoid', maxit = 50, rang = 0.1,
##D     type = "class", algorithm = "rmsprop", rate = 0.01, batch = 100)
##D loss3 = model3$loss
##D model4 = softmaxReg(x, y, hidden = c(), funName = 'sigmoid', maxit = 50, rang = 0.1,
##D     type = "class", algorithm = "momentum", rate = 0.01, batch = 100)
##D loss4 = model4$loss
##D model5 = softmaxReg(x, y, hidden = c(), funName = 'sigmoid', maxit = 50, rang = 0.1,
##D     type = "class", algorithm = "nag", rate = 0.01, batch = 100)
##D loss5 = model5$loss
##D 
##D # plot the loss convergence
##D iteration = c(1:length(loss1))
##D myplot = plot(iteration, loss1, xlab = "iteration", ylab = "loss", ylim = c(0,
##D     max(loss1,loss2,loss3,loss4,loss5) + 0.01), type = "p", col = "black", cex = 0.7)
##D title("Convergence Comparision Between Learning Algorithms")
##D points(iteration, loss2, col = "red", pch = 2, cex = 0.7)
##D points(iteration, loss3, col = "blue", pch = 3, cex = 0.7)
##D points(iteration, loss4, col = "green", pch = 4, cex = 0.7)
##D points(iteration, loss5, col = "magenta", pch = 5, cex = 0.7)
##D 
##D legend("topright", c("SGD", "Adagrad", "RMSprop", "Momentum", "NAG"),
##D     col = c("black", "red", "blue", "green", "magenta"),pch = c(1,2,3,4,5))
##D 
##D save.image()
##D 
## End(Not run)



