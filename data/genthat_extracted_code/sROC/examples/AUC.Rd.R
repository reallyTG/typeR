library(sROC)


### Name: AUC
### Title: Area Under Curve
### Aliases: AUC
### Keywords: smoothing

### ** Examples


set.seed(100)
n <- 200
x <- rlnorm(n, mean=2, sd=1)
y <- rnorm(n,mean=2,sd=2)

xy.ROC <- kROC(c(x,NA,NA),c(y,1.2, NA), na.rm=TRUE)
plot(xy.ROC)
AUC(xy.ROC)
	



