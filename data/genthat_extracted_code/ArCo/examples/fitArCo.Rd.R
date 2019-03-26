library(ArCo)


### Name: fitArCo
### Title: Estimates the ArCo using the model selected by the user
### Aliases: fitArCo
### Keywords: ArCo

### ** Examples

#############################
## === Example for q=1 === ##
#############################
data(data.q1)
# = First unit was treated on t=51 by adding 
# a constant equal to one standard deviation

data=list(data.q1) # = Even if q=1 the data must be in a list

## == Fitting the ArCo using linear regression == ##
# = creating fn and p.fn function = #
fn=function(X,y){
return(lm(y~X))
}
p.fn=function(model,newdata){
b=coef(model)
return(cbind(1,newdata) %*% b)
}

ArCo=fitArCo(data = data,fn = fn, p.fn = p.fn, treated.unit = 1 , t0 = 51)

#############################
## === Example for q=2 === ##
#############################

# = First unit was treated on t=51 by adding constants of one standard deviation
# for the first and second variables

data(data.q2) # data is already a list

## == Fitting the ArCo using the package glmnet == ##
## == Quadratic Spectral kernel weights for two lags == ##

## == Fitting the ArCo using the package glmnet == ##
## == Bartlett kernel weights for two lags == ##
require(glmnet)
set.seed(123)
ArCo2=fitArCo(data = data.q2,fn = cv.glmnet, p.fn = predict,treated.unit = 1 , t0 = 51, 
             VCOV.type = "nw",kernel.type = "QuadraticSpectral",VCOV.lag = 2)




