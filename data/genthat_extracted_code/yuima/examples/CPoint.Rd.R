library(yuima)


### Name: CPoint
### Title: Volatility structural change point estimator
### Aliases: CPoint qmleL qmleR
### Keywords: ts

### ** Examples

## Not run: 
##D diff.matrix <- matrix(c("theta1.1*x1","0*x2","0*x1","theta1.2*x2"), 2, 2)
##D 
##D drift.c <- c("1-x1", "3-x2")
##D drift.matrix <- matrix(drift.c, 2, 1)
##D 
##D ymodel <- setModel(drift=drift.matrix, diffusion=diff.matrix, time.variable="t",
##D state.variable=c("x1", "x2"), solve.variable=c("x1", "x2"))
##D n <- 1000
##D 
##D set.seed(123)
##D 
##D t1 <- list(theta1.1=.1, theta1.2=0.2)
##D t2 <- list(theta1.1=.6, theta1.2=.6)
##D 
##D tau <- 0.4
##D ysamp1 <- setSampling(n=tau*n, Initial=0, delta=0.01)
##D yuima1 <- setYuima(model=ymodel, sampling=ysamp1)
##D yuima1 <- simulate(yuima1, xinit=c(1, 1), true.parameter=t1)
##D 
##D x1 <- yuima1@data@zoo.data[[1]]
##D x1 <- as.numeric(x1[length(x1)])
##D x2 <- yuima1@data@zoo.data[[2]]
##D x2 <- as.numeric(x2[length(x2)])
##D 
##D ysamp2 <- setSampling(Initial=n*tau*0.01, n=n*(1-tau), delta=0.01)
##D yuima2 <- setYuima(model=ymodel, sampling=ysamp2)
##D 
##D yuima2 <- simulate(yuima2, xinit=c(x1, x2), true.parameter=t2)
##D 
##D 
##D yuima <- yuima1
##D yuima@data@zoo.data[[1]] <- c(yuima1@data@zoo.data[[1]], yuima2@data@zoo.data[[1]][-1])
##D yuima@data@zoo.data[[2]] <- c(yuima1@data@zoo.data[[2]], yuima2@data@zoo.data[[2]][-1])
##D 
##D plot(yuima)
##D 
##D # estimation of change point for given parameter values
##D t.est <- CPoint(yuima,param1=t1,param2=t2, plot=TRUE)
##D 
##D 
##D low <- list(theta1.1=0, theta1.2=0)
##D 
##D # first state estimate of parameters using small 
##D # portion of data in the tails
##D tmp1 <- qmleL(yuima,start=list(theta1.1=0.3,theta1.2=0.5),t=1.5,
##D         lower=low, method="L-BFGS-B")
##D tmp1
##D tmp2 <- qmleR(yuima,start=list(theta1.1=0.3,theta1.2=0.5), t=8.5,
##D         lower=low, method="L-BFGS-B")
##D tmp2
##D 
##D 
##D # first stage changepoint estimator
##D t.est2 <- CPoint(yuima,param1=coef(tmp1),param2=coef(tmp2))
##D t.est2$tau
##D 
##D 
##D # second stage estimation of parameters given first stage
##D # change point estimator
##D tmp11 <- qmleL(yuima,start=as.list(coef(tmp1)), t=t.est2$tau-0.1,
##D  lower=low, method="L-BFGS-B")
##D tmp11
##D 
##D tmp21 <- qmleR(yuima,start=as.list(coef(tmp2)), t=t.est2$tau+0.1,
##D  lower=low, method="L-BFGS-B")
##D tmp21
##D 
##D # second stage estimator of the change point
##D CPoint(yuima,param1=coef(tmp11),param2=coef(tmp21))
##D 
##D 
##D ## One dimensional example: non linear case
##D diff.matrix <- matrix("(1+x1^2)^theta1", 1, 1)
##D drift.c <- c("x1")
##D 
##D ymodel <- setModel(drift=drift.c, diffusion=diff.matrix, time.variable="t",
##D state.variable=c("x1"), solve.variable=c("x1"))
##D n <- 500
##D 
##D set.seed(123)
##D 
##D y0 <- 5 # initial value
##D theta00 <- 1/5
##D gamma <- 1/4
##D 
##D 
##D theta01 <- theta00+n^(-gamma)
##D 
##D 
##D t1 <- list(theta1= theta00)
##D t2 <- list(theta1= theta01)
##D 
##D tau <- 0.4
##D ysamp1 <- setSampling(n=tau*n, Initial=0, delta=1/n)
##D yuima1 <- setYuima(model=ymodel, sampling=ysamp1)
##D yuima1 <- simulate(yuima1, xinit=c(5), true.parameter=t1)
##D x1 <- yuima1@data@zoo.data[[1]]
##D x1 <- as.numeric(x1[length(x1)])
##D 
##D ysamp2 <- setSampling(Initial=tau, n=n*(1-tau), delta=1/n)
##D yuima2 <- setYuima(model=ymodel, sampling=ysamp2)
##D 
##D yuima2 <- simulate(yuima2, xinit=c(x1), true.parameter=t2)
##D 
##D 
##D yuima <- yuima1
##D yuima@data@zoo.data[[1]] <- c(yuima1@data@zoo.data[[1]], yuima2@data@zoo.data[[1]][-1])
##D 
##D 
##D plot(yuima)
##D 
##D 
##D t.est <- CPoint(yuima,param1=t1,param2=t2)
##D t.est$tau
##D 
##D low <- list(theta1=0)
##D upp <- list(theta1=1)
##D 
##D # first state estimate of parameters using small 
##D # portion of data in the tails
##D tmp1 <- qmleL(yuima,start=list(theta1=0.5),t=.15,lower=low, upper=upp,method="L-BFGS-B")
##D tmp1
##D tmp2 <- qmleR(yuima,start=list(theta1=0.5), t=.85,lower=low, upper=upp,method="L-BFGS-B")
##D tmp2
##D 
##D 
##D 
##D # first stage changepoint estimator
##D t.est2 <- CPoint(yuima,param1=coef(tmp1),param2=coef(tmp2))
##D t.est2$tau
##D 
##D 
##D # second stage estimation of parameters given first stage
##D # change point estimator
##D tmp11 <- qmleL(yuima,start=as.list(coef(tmp1)), t=t.est2$tau-0.1,
##D    lower=low, upper=upp,method="L-BFGS-B")
##D tmp11
##D 
##D tmp21 <- qmleR(yuima,start=as.list(coef(tmp2)), t=t.est2$tau+0.1,
##D   lower=low, upper=upp,method="L-BFGS-B")
##D tmp21
##D 
##D 
##D # second stage estimator of the change point
##D CPoint(yuima,param1=coef(tmp11),param2=coef(tmp21),plot=TRUE)
## End(Not run)



