library(BART)


### Name: predict.wbart
### Title: Predicting new observations with a previously fitted BART model
### Aliases: predict.wbart
### Keywords: nonparametric tree regression nonlinear

### ** Examples

##simulate data (example from Friedman MARS paper)
f = function(x){
10*sin(pi*x[,1]*x[,2]) + 20*(x[,3]-.5)^2+10*x[,4]+5*x[,5]
}
sigma = 1.0  #y = f(x) + sigma*z , z~N(0,1)
n = 100      #number of observations
set.seed(99)
x=matrix(runif(n*10),n,10) #10 variables, only first 5 matter
y=f(x)

##test BART with token run to ensure installation works
set.seed(99)
post = wbart(x,y,nskip=5,ndpost=5)
x.test = matrix(runif(500*10),500,10)

## Not run: 
##D ##run BART
##D set.seed(99)
##D post = wbart(x,y)
##D x.test = matrix(runif(500*10),500,10)
##D pred = predict(post, x.test, mu=mean(y))
##D 
##D plot(apply(pred, 2, mean), f(x.test))
##D 
## End(Not run)



