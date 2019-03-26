library(CARRoT)


### Name: get_predictions_lin
### Title: Predictions for linear regression
### Aliases: get_predictions_lin

### ** Examples

trset<-matrix(c(rnorm(90,2,4),runif(90,0,0.5),rbinom(90,1,0.5)),ncol=3)

testset<-matrix(c(rnorm(10,2,4),runif(10,0,0.5),rbinom(10,1,0.5)),ncol=3)

get_predictions_lin(trset,testset,runif(90,0,1),10)



