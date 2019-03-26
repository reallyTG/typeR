## ----include=F-----------------------------------------------------------
library(PUlasso)
library(Matrix)

## ------------------------------------------------------------------------
data("simulPU")

## ----echo=F,fig.show='hold'----------------------------------------------
dt=data.frame(x1=simulPU$X[,1],x2=simulPU$X[,2],y=simulPU$y,z=simulPU$z)
par(mar=c(2,2,2,2))
plot(dt$x1,dt$x2,col=adjustcolor(ifelse(simulPU$z,"red","navy"),alpha.f=0.5),pch=20,main="labelled/unlabelled",xlab="x1",ylab="x2")
legend("bottomright",bg="transparent",legend=c("labelled","unlabelled"),col=c("red","navy"),bty="n"
       ,text.col = c("red", "navy"),pt.bg = c("red","navy"), pch = c(20,20))

plot(dt$x1,dt$x2,col=adjustcolor(ifelse(simulPU$y,"red","blue"),alpha.f=0.5),pch=20,main="(latent) positive/negative",xlab="x1",ylab="x2")
legend("bottomright",bg="transparent",legend=c("positive","negative"),col=c("red","blue"),bty="n"
       ,text.col = c("red", "blue"),pt.bg = c("red","blue"), pch = c(20,20))


## ------------------------------------------------------------------------
(fit=grpPUlasso(X=simulPU$X,z=simulPU$z,pi=simulPU$truePY1))

## ------------------------------------------------------------------------
coef(fit, lambda=fit$lambda[30])

## ------------------------------------------------------------------------
xnew = matrix(rnorm(10),2,5)
predict(fit,newdata = xnew,lambda = fit$lambda[30])

## ------------------------------------------------------------------------
(cv.fit = cv.grpPUlasso(X=simulPU$X,z=simulPU$z,pi=simulPU$truePY1))

## ----include=F-----------------------------------------------------------
# qplot(log(cv.fit$lambda),cv.fit$cvm)+
#   geom_errorbar(aes(ymin=cv.fit$cvm-cv.fit$cvsd,ymax=cv.fit$cvm+cv.fit$cvsd))+
#   xlab("log(lambda)")+ylab("cross-validation deviance")

## ------------------------------------------------------------------------
coef(cv.fit,lambda=cv.fit$lambda.1se)

## ------------------------------------------------------------------------
phat<-predict(cv.fit,newdata = simulPU$X,lambda = cv.fit$lambda.1se,type = "response")
yhat<-1*(phat>0.5)

## ----echo=FALSE----------------------------------------------------------
dt=cbind(dt,yhat)
par(mar=c(2,2,2,2))
plot(dt$x1,dt$x2,col=adjustcolor(ifelse(dt$yhat,"red","blue"),alpha.f=0.5),pch=20,main="(estimated) positive/negative",xlab="x1",ylab="x2")
legend("bottomright",bg="transparent",legend=c("hat_negative","hat_positive"),col=c("red","blue"),bty="n",text.col = c("red", "blue"),pt.bg = c("red","blue"), pch = c(20,20))

## ------------------------------------------------------------------------
grpvec = c(1,2,2,3,3)
fit.grp = grpPUlasso(X=simulPU$X,z=simulPU$z,pi=simulPU$truePY1,group = grpvec)

## ------------------------------------------------------------------------
coef(fit.grp,fit.grp$lambda[12:15])

## ------------------------------------------------------------------------
sparseX <- simulPU$X
sparseX[sample(1:length(simulPU$X),size = length(simulPU$X)*0.95)]<-0
sparseX<-Matrix(sparseX)
class(sparseX)

## ------------------------------------------------------------------------
(spfit<-grpPUlasso(sparseX,simulPU$z,simulPU$truePY1))
newx = matrix(rnorm(10),2,5)
predict(spfit,newdata = newx,lambda = spfit$lambda[10])

## ------------------------------------------------------------------------
newx = matrix(rnorm(10),2,5)
predict(spfit,newdata = newx,lambda = spfit$lambda[10])


## ------------------------------------------------------------------------
(fit.SVRG = grpPUlasso(X=simulPU$X,z=simulPU$z,pi=simulPU$truePY1,method="SVRG",maxit=10000,eps = 1e-6,lambda =fit$lambda[2]))

