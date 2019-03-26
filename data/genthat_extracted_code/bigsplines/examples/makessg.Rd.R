library(bigsplines)


### Name: makessg
### Title: Makes Objects to Fit Generalized Smoothing Spline ANOVA Models
### Aliases: makessg

### ** Examples


##########   EXAMPLE  ##########

# function with two continuous predictors
set.seed(1)
myfun <- function(x1v,x2v){
  sin(2*pi*x1v) + log(x2v+.1) + cos(pi*(x1v-x2v))
}
ndpts <- 1000
x1v <- runif(ndpts)
x2v <- runif(ndpts)

# binomial response (no weights)
set.seed(773)
lp <- myfun(x1v,x2v)
p <- 1/(1+exp(-lp))
y <- rbinom(n=ndpts,size=1,p=p)

# fit 2 possible models (create information 2 separate times)
system.time({
  intmod <- bigssg(y~x1v*x2v,family="binomial",type=list(x1v="cub",x2v="cub"),nknots=50)
  addmod <- bigssg(y~x1v+x2v,family="binomial",type=list(x1v="cub",x2v="cub"),nknots=50)
})

# fit 2 possible models (create information 1 time)
system.time({
  makemod <- makessg(y~x1v*x2v,family="binomial",type=list(x1v="cub",x2v="cub"),nknots=50)
  int2mod <- bigssg(y~x1v*x2v,data=makemod)
  add2mod <- bigssg(y~x1v+x2v,data=makemod)
})

# check difference (no difference)
crossprod( intmod$fitted.values - int2mod$fitted.values )
crossprod( addmod$fitted.values - add2mod$fitted.values )




