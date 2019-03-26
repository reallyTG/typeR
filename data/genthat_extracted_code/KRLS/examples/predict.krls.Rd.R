library(KRLS)


### Name: predict.krls
### Title: Predict method for Kernel-based Regularized Least Squares (KRLS)
###   Model Fits
### Aliases: predict.krls

### ** Examples


# make up data
X <- seq(-3,3,.1)
Y <- sin(X) + rnorm(length(X),.1)

# fit krls
krlsout <- krls(y=Y,X=X)

# get in-sample prediction 
predin <- predict(krlsout,newdata=X,se.fit=TRUE)

# get out-of-sample prediction
X2 <- runif(5)
predout <- predict(krlsout,newdata=X2,se.fit=TRUE)

# plot true function and predictions
plot(y=sin(X),x=X,type="l",col="red",ylim=c(-1.8,1.8),lwd=2,ylab="f(X)")
points(y=predin$fit,x=X,col="blue",pch=19)
arrows(y1=predin$fit+2*predin$se.fit,
       y0=predin$fit-2*predin$se.fit,
       x1=X,x0=X,col="blue",length=0)
       
points(y=predout$fit,x=X2,col="green",pch=17)
arrows(y1=predout$fit+2*predout $se.fit,
       y0=predout$fit-2*predout $se.fit,
       x1=X2,x0=X2,col="green",length=0)

legend("bottomright",
       legend=c("true f(x)=sin(X)",
                "KRLS fitted in-sample",
                "KRLS fitted out-of-sample"),
       lty=c(1,NA,NA),pch=c(NA,19,17),
       lwd=c(2,NA,NA),
       col=c("red","blue","green"),
       cex=.8)




