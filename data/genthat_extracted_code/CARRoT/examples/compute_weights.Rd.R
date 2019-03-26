library(CARRoT)


### Name: compute_weights
### Title: Weights of predictors
### Aliases: compute_weights

### ** Examples

#creating data-set with for variables

a<-matrix(NA,nrow=100,ncol=4)

#binary variable

a[,1]=rbinom(100,1,0.3)

#continuous variable

a[,2]=runif(100,0,1)

#categorical numeric with les than 5 categories

a[,3]=t(rmultinom(100,1,c(0.2,0.3,0.5)))%*%c(1,2,3)

#categorical numeric with 5 categories

a[,4]=t(rmultinom(100,1,c(0.2,0.3,0.3,0.1,0.1)))%*%c(1,2,3,4,5)

#running the function

compute_weights(4,a)



