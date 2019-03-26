### R code from vignette source 'countgmifs.rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: countgmifs.rnw:67-68
###################################################
options(width = 70)


###################################################
### code chunk number 2: countgmifs.rnw:70-71
###################################################
set.seed(26)


###################################################
### code chunk number 3: countgmifs.rnw:74-79
###################################################
n <- 50 
p <- 500 
intercept<- .5
beta<- c(log(1.5), log(1.5), -log(1.5), -log(1.5), -log(1.5), rep(0,495)) 
alpha<- 0.5 


###################################################
### code chunk number 4: countgmifs.rnw:82-87
###################################################
x<- matrix(rnorm(n*p,0,1), nrow=n, ncol=p, byrow=TRUE) 
colnames(x)<- paste("Var",1:p, sep="")  
mu<- exp(intercept + crossprod(t(x),beta))
y<- rnbinom(n=n, size=1/alpha ,mu=mu) # Discrete response
data<- data.frame(y,x)


###################################################
### code chunk number 5: countgmifs.rnw:91-94
###################################################
library("countgmifs")
nb<-countgmifs(y ~ 1 , data=data, offset=NULL, x=x, epsilon=0.01, tol=0.001, 
       scale=TRUE, verbose=FALSE)


###################################################
### code chunk number 6: countgmifs.rnw:99-100
###################################################
print(nb)


###################################################
### code chunk number 7: countgmifs.rnw:103-104
###################################################
summary(nb)


###################################################
### code chunk number 8: countgmifs.rnw:112-113
###################################################
plot(nb)


###################################################
### code chunk number 9: countgmifs.rnw:120-122
###################################################
coef.BIC<-coef(nb)
coef.BIC[coef.BIC!=0]


###################################################
### code chunk number 10: countgmifs.rnw:126-128
###################################################
coef.AIC<-coef(nb, model.select="AIC")
coef.AIC[coef.AIC!=0]


###################################################
### code chunk number 11: countgmifs.rnw:133-134
###################################################
yhat <- predict(nb, model.select="AIC")


###################################################
### code chunk number 12: countgmifs.rnw:138-139
###################################################
plot(yhat, y)


###################################################
### code chunk number 13: countgmifs.rnw:146-150
###################################################
nb.2<-countgmifs(y ~ Var1 , data=data, offset=NULL, 
      x=c("Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10"), 
      epsilon=0.01, tol=0.001, scale=TRUE, verbose=FALSE)
summary(nb.2)


