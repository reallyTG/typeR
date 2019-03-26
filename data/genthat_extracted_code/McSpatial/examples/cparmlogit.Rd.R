library(McSpatial)


### Name: cparmlogit
### Title: Conditionally parametric logit for two or more choices
### Aliases: cparmlogit
### Keywords: Conditionally Parametric Nonparametric Discrete Choice Models

### ** Examples

library(mlogit)
set.seed(5647)
n = 1000
x <- runif(n,0,pi*sqrt(12))
o <- order(x)
x <- x[o]
form <- yvar~x
nonpar <- ~x

# 2 choices
ybase <- x + rlogis(n)
yvar <- ybase>.5*pi*sqrt(12)
table(yvar)
fit <- glm(yvar~x,family=binomial(link="logit"))
summary(fit)
p <- fitted(fit)
fit1 <- cparmlogit(yvar~x,nonpar=~x,window=.5,kern="tcub")
fit1$lnl
colMeans(fit1$xcoef)
colMeans(fit1$xcoef.se)
cor(p,fit1$pmat)
plot(x,p,xlab="x",ylab="Prob(y=1)",type="l")
lines(x,fit1$pmat[,2],col="red")
legend("topleft",c("Standard Logit","CPAR"),col=c("black","red"),lwd=1)

## Not run: 
##D par(ask=TRUE)
##D # 3 choices
##D ybase1 <- -.5*pi*sqrt(12) + x + rlogis(n)
##D ybase2 <-  -.5*pi*sqrt(12)/2 + x/2 + rlogis(n)
##D yvar <- ifelse(ybase1>ybase2,1,2)
##D yvar <- ifelse(ybase1<0&ybase2<0,0,yvar)
##D table(yvar)
##D mdata <- data.frame(yvar,x)
##D fit <- mlogit(yvar~0 | x, data=mdata, shape="wide")
##D summary(fit)
##D fit1 <- cparmlogit(yvar~x,nonpar=~x,window=.5,kern="tcub")
##D fit1$lnl
##D colMeans(fit1$xcoef)
##D colMeans(fit1$xcoef.se)
##D cor(fit$probabilities,fit1$pmat)
##D plot(x,fit$probabilities[,1],xlab="x",ylab="Prob(y=1)",type="l",main="Prob(y=0)")
##D lines(x,fit1$pmat[,1],col="red")
##D legend("topright",c("Standard Logit","CPAR"),col=c("black","red"),lwd=1)
##D plot(x,fit$probabilities[,2],xlab="x",ylab="Prob(y=1)",type="l",main="Prob(y=1)")
##D lines(x,fit1$pmat[,2],col="red")
##D legend("topleft",c("Standard Logit","CPAR"),col=c("black","red"),lwd=1)
##D plot(x,fit$probabilities[,3],xlab="x",ylab="Prob(y=1)",type="l",main="Prob(y=2)")
##D lines(x,fit1$pmat[,3],col="red")
##D legend("topleft",c("Standard Logit","CPAR"),col=c("black","red"),lwd=1)
##D 
##D # 2 choices, quadratic
##D x2 <- x^2
##D ybase <- x - .1*(x^2) + rlogis(n)
##D yvar <- ybase>median(ybase)
##D table(yvar)
##D fit <- glm(yvar~x+x2,family=binomial(link="logit"))
##D summary(fit)
##D p <- fitted(fit)
##D fit1 <- cparmlogit(yvar~x,nonpar=~x,window=.25,kern="tcub")
##D fit1$lnl
##D colMeans(fit1$xcoef)
##D colMeans(fit1$xcoef.se)
##D cor(p,fit1$pmat)
##D plot(x,p,xlab="x",ylab="Prob(y=1)",type="l")
##D lines(x,fit1$pmat[,2],col="red")
##D legend("topleft",c("Standard Logit","CPAR"),col=c("black","red"),lwd=1)
## End(Not run)



