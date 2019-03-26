library(DiceEval)


### Name: RMA
### Title: Relative Maximal Absolute Error
### Aliases: RMA
### Keywords: models

### ** Examples

X     <- seq(-1,1,0.1)
Y     <- 3*X + rnorm(length(X),0,0.5)
Ypred <- 3*X
print(RMA(Y,Ypred))

# Illustration on Branin function
Branin <- function(x1,x2) {
   x1 <- x1*15-5   
   x2 <- x2*15
   (x2 - 5/(4*pi^2)*(x1^2) + 5/pi*x1 - 6)^2 + 10*(1 - 1/(8*pi))*cos(x1) + 10
}
X <- matrix(runif(24),ncol=2,nrow=12)
Z <- Branin(X[,1],X[,2])
Y <- (Z-mean(Z))/sd(Z)

# Fitting of a Linear model on the data (X,Y)
modLm <- modelFit(X,Y,type = "Linear",formula=Y~X1+X2+X1:X2+I(X1^2)+I(X2^2))

# Prediction on a grid
u <- seq(0,1,0.1)
Y_test_real <- Branin(expand.grid(u,u)[,1],expand.grid(u,u)[,2])
Y_test_pred <- modelPredict(modLm,expand.grid(u,u))
Y_error <- matrix(abs(Y_test_pred-(Y_test_real-mean(Z))/sd(Z)),length(u),length(u))
contour(u, u, Y_error,45)
Y_pred <- modelPredict(modLm,X)
out <- RMA(Y,Y_pred)
for (i in 1:dim(X)[1]){
    points(X[out$index[i],1],X[out$index[i],2],pch=19,col='red',cex=out$error[i]*10)
}



