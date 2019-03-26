library(bootstrap)


### Name: crossval
### Title: K-fold Cross-Validation
### Aliases: crossval
### Keywords: nonparametric

### ** Examples

# cross-validation of least squares regression
# note that crossval is not very efficient, and being a
#  general purpose function, it does not use the
# Sherman-Morrison identity for this special case
   x <- rnorm(85)  
   y <- 2*x +.5*rnorm(85)                      
   theta.fit <- function(x,y){lsfit(x,y)}
   theta.predict <- function(fit,x){
               cbind(1,x)%*%fit$coef         
               }                       
   results <- crossval(x,y,theta.fit,theta.predict,ngroup=6)  
                                      



