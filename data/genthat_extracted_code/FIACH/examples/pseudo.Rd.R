library(FIACH)


### Name: pseudo
### Title: Pseudoinverse.
### Aliases: pseudo

### ** Examples


data(trees, package="datasets")

## with intercept
pinv<-pseudo(x=log(trees$Girth),includeIntercept=TRUE)
## without intercept
pinv<-pseudo(x=log(trees$Girth),includeIntercept=FALSE)
##coefficients
coef<-pseudo(x=log(trees$Girth),y=log(trees$Volume))
## residuals
res<-pseudo(x=log(trees$Girth),y=log(trees$Volume),residuals=TRUE)

## standard model
mod<-lm(log(trees$Volume)~log(trees$Girth))
coef2<-coefficients(mod)
res2<-residuals(mod)
## equality

cbind(coef,coef2) ## same but order reversed
cbind(res,res2)   ## same





