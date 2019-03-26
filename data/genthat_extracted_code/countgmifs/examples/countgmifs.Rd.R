library(countgmifs)


### Name: countgmifs
### Title: Discrete Response Generalized Monotone Incremental Forward
###   Stagewise Regression.
### Aliases: countgmifs
### Keywords: methods regression

### ** Examples

set.seed(26)
n <- 50 # Sample size
p <- 500 # Number of covariates
intercept<- .5
#True parameter values for the 500 covariates
beta<- c(log(1.5), log(1.5), -log(1.5), -log(1.5), -log(1.5), rep(0,495)) 
alpha<- 0.5 # Intercept
x<- matrix(rnorm(n*p,0,1), nrow=n, ncol=p, byrow=TRUE) #Covariate values
colnames(x)<- paste("Var",1:p, sep="")  
mu<- exp(intercept + crossprod(t(x),beta))
y<- rnbinom(n=n, size=1/alpha ,mu=mu) # Discrete response
data<- data.frame(y,x)
nb<-countgmifs(y ~ 1 , data=data, offset=NULL, x=x, epsilon=0.01, tol=0.001, 
       scale=TRUE, verbose=FALSE)
coef.AIC<-coef(nb, model.select="AIC")
coef.AIC[coef.AIC!=0]
predict(nb, model.select="AIC")
plot(predict(nb, model.select="AIC"), y)
plot(nb)



