library(Sim.DiffProc)


### Name: fitsde
### Title: Maximum Pseudo-Likelihood Estimation of 1-D SDE
### Aliases: fitsde fitsde.default summary.fitsde print.fitsde vcov.fitsde
###   AIC.fitsde BIC.fitsde logLik.fitsde coef.fitsde confint.fitsde
### Keywords: fit ts sde

### ** Examples

#####  Example 1:

## Modele GBM (BS)
## dX(t) = theta1 * X(t) * dt + theta2 * x * dW(t)
## Simulation of data
set.seed(1234)

X <- GBM(N =1000,theta=4,sigma=1)
## Estimation: true theta=c(4,1)
fx <- expression(theta[1]*x)
gx <- expression(theta[2]*x)

fres <- fitsde(data=X,drift=fx,diffusion=gx,start = list(theta1=1,theta2=1),
              lower=c(0,0))
fres			   
summary(fres)
coef(fres)
logLik(fres)
AIC(fres)
BIC(fres)
vcov(fres)
confint(fres,level=0.95)

## No test: 
#####  Example 2:


## Nonlinear mean reversion (Ait-Sahalia) modele
## dX(t) = (theta1 + theta2*x + theta3*x^2) * dt + theta4 * x^theta5 * dW(t) 
## Simulation of the process X(t)
set.seed(1234)

f <- expression(1 - 11*x + 2*x^2)
g <- expression(x^0.5)
res <- snssde1d(drift=f,diffusion=g,M=1,N=1000,Dt=0.001,x0=5)
mydata1 <- res$X

## Estimation
## true param theta= c(1,-11,2,1,0.5)
true <- c(1,-11,2,1,0.5)
pmle <- eval(formals(fitsde.default)$pmle)

fx <- expression(theta[1] + theta[2]*x + theta[3]*x^2)
gx <- expression(theta[4]*x^theta[5])

fres <- lapply(1:4, function(i) fitsde(mydata1,drift=fx,diffusion=gx,
	             pmle=pmle[i],start = list(theta1=1,theta2=1,theta3=1,theta4=1,
                 theta5=1),optim.method = "L-BFGS-B"))
Coef <- data.frame(true,do.call("cbind",lapply(1:4,function(i) coef(fres[[i]]))))
names(Coef) <- c("True",pmle)
Summary <- data.frame(do.call("rbind",lapply(1:4,function(i) logLik(fres[[i]]))),
                      do.call("rbind",lapply(1:4,function(i) AIC(fres[[i]]))),
                      do.call("rbind",lapply(1:4,function(i) BIC(fres[[i]]))),
                      row.names=pmle)
names(Summary) <- c("logLik","AIC","BIC")
Coef	
Summary


#####  Example 3:

## dX(t) = (theta1*x*t+theta2*tan(x)) *dt + theta3*t *dW(t)
## Simulation of data
set.seed(1234)

f <- expression(2*x*t-tan(x))
g <- expression(1.25*t)
sim <- snssde1d(drift=f,diffusion=g,M=1,N=1000,Dt=0.001,x0=10)
mydata2 <- sim$X

## Estimation
## true param theta= c(2,-1,1.25)
true <- c(2,-1,1.25)

fx <- expression(theta[1]*x*t+theta[2]*tan(x))
gx <- expression(theta[3]*t)

fres <- lapply(1:4, function(i) fitsde(mydata2,drift=fx,diffusion=gx,
	             pmle=pmle[i],start = list(theta1=1,theta2=1,theta3=1),
				 optim.method = "L-BFGS-B"))
Coef <- data.frame(true,do.call("cbind",lapply(1:4,function(i) coef(fres[[i]]))))
names(Coef) <- c("True",pmle)
Summary <- data.frame(do.call("rbind",lapply(1:4,function(i) logLik(fres[[i]]))),
                      do.call("rbind",lapply(1:4,function(i) AIC(fres[[i]]))),
                      do.call("rbind",lapply(1:4,function(i) BIC(fres[[i]]))),
                      row.names=pmle)
names(Summary) <- c("logLik","AIC","BIC")
Coef
Summary		
## End(No test)

#####  Example 4:

## Application to real data
## CKLS modele vs CIR modele 
## CKLS (mod1):  dX(t) = (theta1+theta2* X(t))* dt + theta3 * X(t)^theta4 * dW(t)
## CIR  (mod2):  dX(t) = (theta1+theta2* X(t))* dt + theta3 * sqrt(X(t))  * dW(t)
set.seed(1234)

data(Irates)
rates <- Irates[,"r1"]
rates <- window(rates, start=1964.471, end=1989.333)

fx1 <- expression(theta[1]+theta[2]*x)
gx1 <- expression(theta[3]*x^theta[4])
gx2 <- expression(theta[3]*sqrt(x))

fitmod1 <- fitsde(rates,drift=fx1,diffusion=gx1,pmle="euler",start = list(theta1=1,theta2=1,
                  theta3=1,theta4=1),optim.method = "L-BFGS-B")
fitmod2 <- fitsde(rates,drift=fx1,diffusion=gx2,pmle="euler",start = list(theta1=1,theta2=1,
                  theta3=1),optim.method = "L-BFGS-B")	
summary(fitmod1)
summary(fitmod2)
coef(fitmod1)
coef(fitmod2)
confint(fitmod1,parm=c('theta2','theta3'))
confint(fitmod2,parm=c('theta2','theta3'))
AIC(fitmod1)
AIC(fitmod2)	
## No test: 
## Display
## CKLS Modele
op <- par(mfrow = c(1, 2))
theta <- coef(fitmod1)
N <- length(rates)
res <- snssde1d(drift=fx1,diffusion=gx1,M=200,t0=time(rates)[1],T=time(rates)[N],
                Dt=deltat(rates),x0=rates[1],N)
plot(res,plot.type="single",ylim=c(0,40))
lines(rates,col=2,lwd=2)
legend("topleft",c("real data","CKLS modele"),inset = .01,col=c(2,1),lwd=2,cex=0.8)

## CIR Modele
theta <- coef(fitmod2)
res <- snssde1d(drift=fx1,diffusion=gx2,M=200,t0=time(rates)[1],T=time(rates)[N],
                Dt=deltat(rates),x0=rates[1],N)
plot(res,plot.type="single",ylim=c(0,40))
lines(rates,col=2,lwd=2)
legend("topleft",c("real data","CIR modele"),inset = .01,col=c(2,1),lwd=2,cex=0.8)
par(op)  
## End(No test)			  



