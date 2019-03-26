library(UBL)


### Name: UBL-package
### Title: UBL: Utility-Based Learning
### Aliases: UBL-package
### Keywords: package

### ** Examples

## Not run: 
##D library(UBL)
##D # an example with the synthetic classification data set provided with the package
##D data(ImbC)
##D 
##D plot(ImbC$X1, ImbC$X2, col = ImbC$Class, xlab = "X1", ylab = "X2")
##D 
##D summary(ImbC)
##D # randomly generate a 30-70% test and train partition 
##D i.train <- sample(1:nrow(ImbC), as.integer(0.7*nrow(ImbC)))
##D trainD <- ImbC[i.train,]
##D testD <- ImbC[-i.train,]
##D 
##D model <- rpart(Class~., trainD)
##D preds <- predict(model, testD, type = "class")
##D table(preds, testD$Class)
##D 
##D # apply random over-sampling approach to balance the data set:
##D 
##D newTrain <- RandOverClassif(Class~., trainD)
##D 
##D newModel <- rpart(Class~., newTrain)
##D newPreds <- predict(newModel, testD, type = "class")
##D table(newPreds, testD$Class)
##D 
##D 
##D # an example with the synthetic regression data set provided with the package
##D data(ImbR)
##D 
##D library(ggplot2)
##D ggplot(ImbR, aes(x = X1, y = X2)) + geom_point(data = ImbR, aes(colour=Tgt)) +
##D       scale_color_gradient(low = "red", high="blue")
##D 
##D boxplot(ImbR$Tgt)
##D #relevance function automatically obtained
##D phiF.args <- phi.control(ImbR$Tgt, method = "extremes", extr.type = "high")
##D y.phi <- phi(sort(ImbR$Tgt),control.parms = phiF.args)
##D 
##D plot(sort(ImbR$Tgt), y.phi, type = "l", xlab = "Tgt variable", ylab = "relevance value")
##D 
##D # set the train and test data
##D i.train <- sample(1:nrow(ImbR), as.integer(0.7*nrow(ImbR)))
##D trainD <- ImbR[i.train,]
##D testD <- ImbR[-i.train,]
##D 
##D # train a model on the original train data
##D library(DMwR)
##D model <- rpartXse(Tgt~., trainD, se = 0)
##D 
##D preds <- predict(model, testD)
##D 
##D plot(testD$Tgt, preds, xlim = c(0,55), ylim = c(0,55))
##D abline(a = 0, b = 1)
##D 
##D # obtain a new train using random under-sampling strategy
##D newTrain <- RandUnderRegress(Tgt~., trainD)
##D newModel <- rpartXse(Tgt~., newTrain, se = 0)
##D newPreds <- predict(newModel, testD)
##D 
##D # plot the predictions for the model obtained with 
##D # the original and the modified train data
##D plot(testD$Tgt, preds, xlim = c(0,55), ylim = c(0,55)) #black for original train
##D abline(a = 0, b = 1, lty=2, col="grey")
##D points(testD$Tgt, newPreds, col="blue", pch=2) #blue for changed train
##D abline(h=30, lty=2, col="grey")
##D abline(v=30, lty=2, col="grey")
## End(Not run)



