library(geex)


### Name: m_estimate
### Title: Estimate parameters and their covariance from a set of
###   estimating equations
### Aliases: m_estimate

### ** Examples

# Estimate the mean and variance of Y1 in the geexex dataset
ex_eeFUN <- function(data){
 function(theta){
   with(data,
    c(Y1 - theta[1],
     (Y1 - theta[1])^2 - theta[2] ))
}}

m_estimate(
 estFUN = ex_eeFUN,
 data  = geexex,
 root_control = setup_root_control(start = c(1,1)))

# compare to the mean() and variance() functions
mean(geexex$Y1)
n <- nrow(geexex)
var(geexex$Y1) * (n - 1)/n

# A simple linear model for regressing X1 and X2 on Y4
lm_eefun <- function(data){
 X <- cbind(1, data$X1, data$X2)
 Y <- data$Y4
 function(theta){
    t(X) %*% (Y - X %*% theta)
   }
 }

m_estimate(
 estFUN = lm_eefun,
 data  = geexex,
 root_control = setup_root_control(start = c(0, 0, 0)))

# Compare to lm() results
summary(lm(Y4 ~ X1 + X2, data = geexex))



