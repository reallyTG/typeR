library(bootstrap)


### Name: bootpred
### Title: Bootstrap Estimates of Prediction Error
### Aliases: bootpred
### Keywords: nonparametric

### ** Examples

# bootstrap prediction error estimation in least squares
#  regression
   x <- rnorm(85)  
   y <- 2*x +.5*rnorm(85)                      
   theta.fit <- function(x,y){lsfit(x,y)}
   theta.predict <- function(fit,x){
               cbind(1,x)%*%fit$coef         
               }    
   sq.err <- function(y,yhat) { (y-yhat)^2}                   
   results <- bootpred(x,y,20,theta.fit,theta.predict,
     err.meas=sq.err)  
                                      
# for a classification problem, a standard choice 
# for err.meas would simply count up the
#  classification errors:
    miss.clas <- function(y,yhat){ 1*(yhat!=y)}
# with this specification,  bootpred estimates 
#  misclassification rate



