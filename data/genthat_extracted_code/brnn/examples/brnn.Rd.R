library(brnn)


### Name: brnn
### Title: brnn
### Aliases: brnn brnn.formula brnn.default coef.brnn print.brnn
###   summary.brnn
### Keywords: models

### ** Examples


## Not run: 
##D 
##D #Load the library
##D library(brnn)
##D 
##D ###############################################################
##D #Example 1 
##D #Noise triangle wave function, similar to example 1 in Foresee and Hagan (1997)
##D 
##D #Generating the data
##D x1=seq(0,0.23,length.out=25)
##D y1=4*x1+rnorm(25,sd=0.1)
##D x2=seq(0.25,0.75,length.out=50)
##D y2=2-4*x2+rnorm(50,sd=0.1)
##D x3=seq(0.77,1,length.out=25)
##D y3=4*x3-4+rnorm(25,sd=0.1)
##D x=c(x1,x2,x3)
##D y=c(y1,y2,y3)
##D 
##D 
##D #With the formula interface
##D out=brnn(y~x,neurons=2)
##D 
##D #With the default S3 method the call is
##D #out=brnn(y=y,x=as.matrix(x),neurons=2)
##D 
##D plot(x,y,xlim=c(0,1),ylim=c(-1.5,1.5),
##D      main="Bayesian Regularization for ANN 1-2-1")
##D lines(x,predict(out),col="blue",lty=2)
##D legend("topright",legend="Fitted model",col="blue",lty=2,bty="n")
##D 
##D ###############################################################
##D #Example 2
##D #sin wave function, example in the Matlab 2010b demo.
##D 
##D x = seq(-1,0.5,length.out=100)
##D y = sin(2*pi*x)+rnorm(length(x),sd=0.1)
##D 
##D #With the formula interface
##D out=brnn(y~x,neurons=3)
##D 
##D #With the default method the call is
##D #out=brnn(y=y,x=as.matrix(x),neurons=3)
##D 
##D plot(x,y)
##D lines(x,predict(out),col="blue",lty=2)
##D 
##D legend("bottomright",legend="Fitted model",col="blue",lty=2,bty="n")
##D 
##D ###############################################################
##D #Example 3
##D #2 Inputs and 1 output
##D #the data used in Paciorek and
##D #Schervish (2004). The data is from a two input one output function with Gaussian noise
##D #with mean zero and standard deviation 0.25
##D 
##D data(twoinput)
##D 
##D #Formula interface
##D out=brnn(y~x1+x2,data=twoinput,neurons=10)
##D 
##D #With the default S3 method
##D #out=brnn(y=as.vector(twoinput$y),x=as.matrix(cbind(twoinput$x1,twoinput$x2)),neurons=10)
##D 
##D f=function(x1,x2) predict(out,cbind(x1,x2))
##D x1=seq(min(twoinput$x1),max(twoinput$x1),length.out=50)
##D x2=seq(min(twoinput$x2),max(twoinput$x2),length.out=50)
##D z=outer(x1,x2,f) # calculating the density values
##D 
##D transformation_matrix=persp(x1, x2, z,
##D                             main="Fitted model",
##D                             sub=expression(y==italic(g)~(bold(x))+e),
##D                             col="lightgreen",theta=30, phi=20,r=50, 
##D                             d=0.1,expand=0.5,ltheta=90, lphi=180,
##D                             shade=0.75, ticktype="detailed",nticks=5)
##D points(trans3d(twoinput$x1,twoinput$x2, f(twoinput$x1,twoinput$x2), 
##D                transformation_matrix), col = "red")
##D 
##D ###############################################################
##D #Example 4
##D #Gianola et al. (2011).
##D #Warning, it will take a while
##D 
##D #Load the Jersey dataset
##D data(Jersey)
##D 
##D #Fit the model with the FULL DATA
##D #Formula interface
##D out=brnn(pheno$yield_devMilk~G,neurons=2,verbose=TRUE)
##D 
##D #Obtain predictions and plot them against fitted values
##D plot(pheno$yield_devMilk,predict(out))
##D 
##D #Predictive power of the model using the SECOND set for 10 fold CROSS-VALIDATION
##D data=pheno
##D data$X=G
##D data$partitions=partitions
##D 
##D #Fit the model for the TESTING DATA
##D out=brnn(yield_devMilk~X,
##D          data=subset(data,partitions!=2),neurons=2,verbose=TRUE)
##D 
##D #Plot the results
##D #Predicted vs observed values for the training set
##D par(mfrow=c(2,1))
##D plot(out$y,predict(out),xlab=expression(hat(y)),ylab="y")
##D cor(out$y,predict(out))
##D 
##D #Predicted vs observed values for the testing set
##D yhat_R_testing=predict(out,newdata=subset(data,partitions==2))
##D ytesting=pheno$yield_devMilk[partitions==2]
##D plot(ytesting,yhat_R_testing,xlab=expression(hat(y)),ylab="y")
##D cor(ytesting,yhat_R_testing)
##D 
## End(Not run)




