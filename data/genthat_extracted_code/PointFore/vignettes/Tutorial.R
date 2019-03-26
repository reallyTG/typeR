## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(PointFore)

## ------------------------------------------------------------------------
set.seed(1)

Y.mean <- rnorm(200,0,1)

Y <- rnorm(200,Y.mean,1)

X <- Y.mean

## ------------------------------------------------------------------------
res.const <- estimate.functional(
                            iden.fct = expectiles,
                            model = constant,
                            Y = Y,
                            X = X,
                            theta0 = 0.5)

summary(res.const)

## ------------------------------------------------------------------------
res.flexible <- estimate.functional(iden.fct = expectiles,
                                    model = probit_linear,
                                    Y = Y,X = X,
                                    theta0 = c(0,0),
                                    stateVariable = X)
summary(res.flexible)

## ---- fig.show="hold", fig.cap = "The results of the constant and flexible model plotted against the forecast."----
plot(res.const)
plot(res.flexible)

## ------------------------------------------------------------------------
library(car)

## ------------------------------------------------------------------------
linearHypothesis(res.const$gmm,"Theta[1]=0.5")

## ------------------------------------------------------------------------
linearHypothesis(res.flexible$gmm,c("Theta[1]=0", "Theta[2]=0"))

linearHypothesis(res.flexible$gmm,"Theta[2]=0")

## ------------------------------------------------------------------------
break_model <- function(stateVariable, theta)
{
  if(length(theta)!=2)
    stop("Wrong dimension of theta")
  
  return(boot::inv.logit(theta[1]+theta[2]*(stateVariable>0)))
}

## ------------------------------------------------------------------------
res.break <- estimate.functional(iden.fct = expectiles,
                                    model = break_model,
                                    Y = Y,X = X,
                                    theta0 = c(0,0),
                                    stateVariable = X)

summary(res.break)

plot(res.break)

## ------------------------------------------------------------------------
X <- Y.mean + 0.2 *(Y.mean>0)

res.break <- estimate.functional(iden.fct = expectiles,
                                    model = break_model,
                                    Y = Y,X = X,
                                    theta0 = c(0,0),
                                    stateVariable = X)

summary(res.break)

plot(res.break)

## ------------------------------------------------------------------------
res.flexible <- estimate.functional(iden.fct = expectiles,
                                    model = probit_linear,
                                    Y = Y,X = X,
                                    theta0 = c(0,0),
                                    stateVariable = X)

summary(res.flexible)

plot(res.flexible)

## ------------------------------------------------------------------------
res.flexible <- estimate.functional(iden.fct = expectiles,
                                    model = probit_linear,
                                    Y = Y,X = X,
                                    theta0 = c(0,0),
                                    instruments = c("lag(Y)","X","sign(X)*X^2"),
                                    stateVariable = X)

summary(res.flexible)$Jtest

res.break <- estimate.functional(iden.fct = expectiles,
                                    model = probit_break,
                                    Y = Y,X = X,
                                    theta0 = c(0,0),
                                    instruments = c("lag(Y)","X","sign(X)*X^2"),
                                    stateVariable = X)

summary(res.break)$Jtest

