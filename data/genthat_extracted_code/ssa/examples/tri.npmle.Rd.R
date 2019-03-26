library(ssa)


### Name: tri.npmle
### Title: Trivariate NPMLE
### Aliases: tri.npmle

### ** Examples

## generate parameters from mixing distribution
p <- 1000;
set.seed(1);
theta1 <- rnorm(p);
theta2 <- -theta1+rnorm(p);
theta3 <- 0.5*theta1+theta2+rnorm(p);
## generate observed variables
X1 <- rnorm(p,theta1,1);
X2 <- rnorm(p,theta2,1);
X3 <- rnorm(p,theta3,1);
## set grid points
d1 <- 15; d2 <- 20; d3 <- 25;
Theta1 <- seq(min(X1),max(X1),length=d1);
Theta2 <- seq(min(X2),max(X2),length=d2);
Theta3 <- seq(min(X3),max(X3),length=d3);
## calculate D matrices
D1 <- outer(X1,Theta1,function(x,y){
  dnorm(x,y,1);
});
D2 <- outer(X2,Theta2,function(x,y){
  dnorm(x,y,1);
});
D3 <- outer(X3,Theta3,function(x,y){
  dnorm(x,y,1);
});
## fit npmle
g <- tri.npmle(D1,D2,D3);
par(mfrow=c(1,3));
contour(Theta1,Theta2,apply(g,c(1,2),sum));
points(theta1,theta2);
contour(Theta1,Theta3,apply(g,c(1,3),sum));
points(theta1,theta3);
contour(Theta2,Theta3,apply(g,c(2,3),sum));
points(theta2,theta3);




