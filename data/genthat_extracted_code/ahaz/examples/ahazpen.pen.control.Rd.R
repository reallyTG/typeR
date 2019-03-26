library(ahaz)


### Name: ahazpen.pen.control
### Title: Penalty controls for ahazpen
### Aliases: ahazpen.pen.control lasso.control sscad.control
### Keywords: misc

### ** Examples

data(sorlie)

# Break ties
set.seed(10101)
time <- sorlie$time+runif(nrow(sorlie))*1e-2

# Survival data + covariates
surv <- Surv(time,sorlie$status)
X <- as.matrix(sorlie[,3:ncol(sorlie)])

# Fit additive hazards regression model with elasticnet penalty
model <- ahazpen(surv,X,penalty=lasso.control(alpha=0.1),dfmax=30)
plot(model)

# Adaptive lasso with weights 1/|beta_i|^0.5. Note that, although
# we do not use 'weights', it MUST be included as an argument
adafun <- function(surv,X,weights)
 return(1/abs(coef(ahaz(surv,X)))^.5)
model <- ahazpen(surv,X[,1:50],penalty=lasso.control(ada.wgt=adafun))
plot(model)

# One-step SCAD with initial solution derived from univariate regressions
scadfun <- function(surv,X,weights){
 fit <- ahaz(surv,X,univariate=TRUE)
 return(coef(fit))
}
set.seed(10101)
model.ssc <- tune.ahazpen(surv,X,dfmax=30,penalty=sscad.control(init.sol=scadfun))
plot(model.ssc)



