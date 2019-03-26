library(brnn)


### Name: brnn_extended
### Title: brnn_extended
### Aliases: brnn_extended brnn_extended.formula brnn_extended.default
###   coef.brnn_extended print.brnn_extended summary.brnn_extended
### Keywords: models

### ** Examples


## Not run: 
##D 
##D #Example 5
##D #Warning, it will take a while
##D 
##D #Load the Jersey dataset
##D data(Jersey)
##D 
##D #Predictive power of the model using the SECOND set for 10 fold CROSS-VALIDATION
##D data=pheno
##D data$G=G
##D data$D=D
##D data$partitions=partitions
##D 
##D #Fit the model for the TESTING DATA for Additive + Dominant
##D out=brnn_extended(yield_devMilk ~ G | D,
##D                                   data=subset(data,partitions!=2),
##D                                   neurons1=2,neurons2=2,epochs=100,verbose=TRUE)
##D 
##D #Plot the results
##D #Predicted vs observed values for the training set
##D par(mfrow=c(2,1))
##D yhat_R_training=predict(out)
##D plot(out$y,yhat_R_training,xlab=expression(hat(y)),ylab="y")
##D cor(out$y,yhat_R_training)
##D 
##D #Predicted vs observed values for the testing set
##D newdata=subset(data,partitions==2,select=c(D,G))
##D ytesting=pheno$yield_devMilk[partitions==2]
##D yhat_R_testing=predict(out,newdata=newdata)
##D plot(ytesting,yhat_R_testing,xlab=expression(hat(y)),ylab="y")
##D cor(ytesting,yhat_R_testing)
##D   
## End(Not run)
 



