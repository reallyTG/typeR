library(CARS)


### Name: CARS
### Title: The CARS procedure for controlling the false discovery rate
### Aliases: CARS CARS-package CARS

### ** Examples

X <- matrix(rnorm(1000),ncol=5,nrow=200,byrow=TRUE);
Y <- matrix(rep(c(0,3),c(800,200))+rnorm(1000),ncol=5,nrow=200,byrow=TRUE);
CARS(X,Y,0.05,tau=0.9);




