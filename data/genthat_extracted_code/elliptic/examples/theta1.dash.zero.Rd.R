library(elliptic)


### Name: theta1.dash.zero
### Title: Derivative of theta1
### Aliases: theta1.dash.zero theta1.dash.zero.q e16.28.6
### Keywords: math

### ** Examples

#Now, try and get 16.28.6, p576: theta1dash=theta2*theta3*theta4:

m <- 0.5
derivative <- function(small){(theta1(small,m=m)-theta1(0,m=m))/small}
right.hand.side <-  theta2(0,m=m)*theta3(0,m=m)*theta4(0,m=m)
derivative(1e-7)-right.hand.side




