library(gss)


### Name: ssllrm
### Title: Fitting Smoothing Spline Log-Linear Regression Models
### Aliases: ssllrm
### Keywords: smooth models regression

### ** Examples

## Simulate data
test <- function(x)
        {.3*(1e6*(x^11*(1-x)^6)+1e4*(x^3*(1-x)^10))-2}
x <- (0:100)/100
p <- 1-1/(1+exp(test(x)))
y <- rbinom(x,3,p)
y1 <- as.ordered(y)
y2 <- as.factor(rbinom(x,1,p))
## Fit model
fit <- ssllrm(~y1*y2*x,~y1+y2)

## Evaluate f(y|x)
est <- predict(fit,data.frame(x=x),
               data.frame(y1=as.factor(0:3),y2=as.factor(rep(0,4))))
## f(y|x) at all y values (fit$qd.pt)
est <- predict(fit,data.frame(x=x))

## Evaluate contrast of log f(y|x)
est <- predict(fit,data.frame(x=x),odds=c(-1,.5,.5,0),
               data.frame(y1=as.factor(0:3),y2=as.factor(rep(0,4))),se=TRUE)
## Odds ratio log{f(0,0|x)/f(3,0|x)}
est <- predict(fit,data.frame(x=x),odds=c(1,-1),
               data.frame(y1=as.factor(c(0,3)),y2=as.factor(c(0,1))),se=TRUE)

## KL projection
kl <- project(fit,include=c("y2:x","y1:y2","y1:x","y2:x"))

## Clean up
## Not run: 
##D rm(test,x,p,y,y1,y2,fit,est,kl)
##D dev.off()
## End(Not run)



