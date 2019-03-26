### R code from vignette source 'predictnl.Rnw'

###################################################
### code chunk number 1: predictnl.Rnw:41-47
###################################################
thetahat <- c(0.1,0.2)
Sigma <- matrix(c(1,0.3,0.3,1),2,2)
print(partial <- D(expression(exp(theta)),"theta"))
partial <- diag(eval(partial,list(theta=thetahat)))
var <- t(partial) %*% Sigma %*% partial
data.frame(fit=exp(thetahat), se.fit=sqrt(diag(var)))


###################################################
### code chunk number 2: predictnl.Rnw:54-58
###################################################
myD <- function(f,x,eps=1e-5) (f(x+eps)-f(x-eps))/(2*eps)
partial <- diag(myD(exp,thetahat))
var <- t(partial) %*% Sigma %*% partial
data.frame(fit=exp(thetahat),se.fit=sqrt(diag(var)))


###################################################
### code chunk number 3: predictnl.Rnw:63-71
###################################################
library(rstpm2)
vcov.test <- function(object) object$vcov
coef.test <- function(object) object$coefficients # default
"coef<-.test" <- function(object,value) 
  { object$coefficients <- value; object} # default
fit <- structure(list(vcov=Sigma,coefficients=thetahat),class="test")
expcoef <- function(object) exp(coef(object))
predictnl(fit,expcoef)


###################################################
### code chunk number 4: predictnl.Rnw:75-76
###################################################
rstpm2:::"coef<-.default"


###################################################
### code chunk number 5: predictnl.Rnw:80-89
###################################################
set.seed(123456)
x1 <- rnorm(1000)
y <- rnorm(1000,x1)
fit <- lm(y~x1)
invert <- function(object,newdata) {
    thetahat <- coef(object)
    (newdata$y-thetahat[1])/thetahat[2]
}
predictnl(fit, invert, newdata=data.frame(y=seq(0,2,by=0.5)))


###################################################
### code chunk number 6: predictnl.Rnw:93-105
###################################################
set.seed(123456)
x1 <- rnorm(1000)
x2 <- rbinom(1000,1,0.5)
y <- rnorm(1000,x1+x2)
fit <- lm(y~x1+x2)
standardise <- function(object,newdata) mean(predict(object,newdata))
predictnl(fit, standardise, newdata=data.frame(x1,x2=0))
predictnl(fit, standardise, newdata=data.frame(x1,x2=1))
standdiff <- function(object,newdata) 
    standardise(object,transform(newdata,x2=1))-
        standardise(object,transform(newdata,x2=0))
predictnl(fit, standdiff, newdata=data.frame(x1))


###################################################
### code chunk number 7: predictnl.Rnw:120-142
###################################################
brcancer2 <- transform(brcancer, x4.23=x4 %in% 2:3)
fit1 <- stpm2(Surv(rectime,censrec==1)~hormon*x4.23,data=brcancer2,df=3)
newd <- data.frame(hormon=0,x4.23=FALSE)
RERI <- function(object, newdata,
                 var1, val1=1, 
                 var2, val2=1) {
    exp1 <- function(data) {data[[var1]] <- val1; data}
    exp2 <- function(data) {data[[var2]] <- val2; data}
    s11 <- predict(object, newdata=exp1(exp2(newdata)), type="surv")
    s10 <- predict(object, newdata=exp1(newdata), type="surv")
    s01 <- predict(object, newdata=exp2(newdata), type="surv")
    s00 <- predict(object, newdata, type="surv")
    -(s11-s10-s01+s00)/(1-s00)
}
times <- seq(0,2500,length=301)[-1]
reri <- predictnl(fit1,fun=RERI,newdata=transform(newd,rectime=times),
                  var1="hormon",var2="x4.23",val2=TRUE)
with(reri, matplot(times,fit+cbind(0,-1.96*se.fit,+1.96*se.fit),
                   type="l",lty=c(1,2,2),col=1,
                    xlab="Time since diagnosis", ylab="RERI"))
abline(h=0,lty=3)



