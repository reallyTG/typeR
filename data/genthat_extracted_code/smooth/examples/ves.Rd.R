library(smooth)


### Name: ves
### Title: Vector Exponential Smoothing in SSOE state space model
### Aliases: ves
### Keywords: models multivariate nonlinear regression ts

### ** Examples


Y <- ts(cbind(rnorm(100,100,10),rnorm(100,75,8)),frequency=12)

# The simplest model applied to the data with the default values
ves(Y,model="ANN",h=10,holdout=TRUE)

# Damped trend model with the dependent persistence
ves(Y,model="AAdN",persistence="d",h=10,holdout=TRUE)

# Multiplicative damped trend model with individual phi
ves(Y,model="MMdM",persistence="i",h=10,holdout=TRUE,initialSeason="g")

Y <- cbind(c(rpois(25,0.1),rpois(25,0.5),rpois(25,1),rpois(25,5)),
           c(rpois(25,0.1),rpois(25,0.5),rpois(25,1),rpois(25,5)))

# Intermittent VES with logistic probability
ves(Y,model="MNN",h=10,holdout=TRUE,intermittent="l")




