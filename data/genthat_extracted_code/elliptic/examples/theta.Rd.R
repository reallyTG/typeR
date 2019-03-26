library(elliptic)


### Name: theta
### Title: Jacobi theta functions 1-4
### Aliases: theta theta1 theta2 theta3 theta4 e16.27.1 e16.27.2 e16.27.3
###   e16.27.4 theta.00 theta.01 theta.10 theta.11 Theta Theta1 H H1
###   e16.31.1 e16.31.2 e16.31.3 e16.31.4
### Keywords: array

### ** Examples


m <- 0.5
derivative <- function(small){(theta1(small,m=m)-theta1(0,m=m))/small}
right.hand.side1 <-  theta2(0,m=m)*theta3(0,m=m)*theta4(0,m=m)
right.hand.side2 <-  theta1.dash.zero(m)

derivative(1e-5)-right.hand.side1   #should be zero
derivative(1e-5)-right.hand.side2   #should be zero



