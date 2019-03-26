library(CGP)


### Name: predict.CGP
### Title: Predict from the composite Gaussian process model
### Aliases: predict.CGP

### ** Examples

### A simulated example from Gramacy and Lee (2012) ``Cases for the nugget 
### in modeling computer experiments''. \emph{Statistics and Computing}, 22, 713-722.

#Training data
X<-c(0.775,0.83,0.85,1.05,1.272,1.335,1.365,1.45,1.639,1.675,
1.88,1.975,2.06,2.09,2.18,2.27,2.3,2.36,2.38,2.39)
yobs<-sin(10*pi*X)/(2*X)+(X-1)^4

#Testing data
UU<-seq(from=0.7,to=2.4,by=0.001)
y_true<-sin(10*pi*UU)/(2*UU)+(UU-1)^4

plot(UU,y_true,type="l",xlab="x",ylab="y")
points(X,yobs,col="red")
## Not run: 
##D #Fit the CGP model 
##D mod<-CGP(X,yobs)
##D summary(mod)
##D 
##D mod$objval
##D #-40.17315
##D mod$lambda
##D #0.01877432
##D mod$theta
##D #2.43932
##D mod$alpha
##D #578.0898
##D mod$bandwidth
##D #1
##D mod$rmscv
##D #0.3035192
##D 
##D #Predict for the testing data 'UU'
##D modpred<-predict(mod,UU)
##D 
##D #Plot the fitted CGP model
##D #Red: final predictor; Blue: global trend
##D lines(UU,modpred$Yp,col="red",lty=3,lwd=2)
##D lines(UU,modpred$gp,col="blue",lty=5,lwd=1.8)
## End(Not run)



