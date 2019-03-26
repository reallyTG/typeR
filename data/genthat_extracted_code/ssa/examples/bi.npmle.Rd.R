library(ssa)


### Name: bi.npmle
### Title: Bivariate NPMLE
### Aliases: bi.npmle

### ** Examples

## generate parameters from mixing distribution
p <- 1000;
set.seed(1); theta1 <- rnorm(p); theta2 <- -theta1+rnorm(p);
## generate observed variables
X1 <- rnorm(p,theta1,1); X2 <- rnorm(p,theta2,1);
## set grid points
d1 <- 25; d2 <- 30;
Theta1 <- seq(min(X1),max(X1),length=d1);
Theta2 <- seq(min(X2),max(X2),length=d2);
## calculate D matrices
D1 <- outer(X1,Theta1,function(x,y){
  dnorm(x,y,1);
});
D2 <- outer(X2,Theta2,function(x,y){
  dnorm(x,y,1);
});
## fit npmle
g <- bi.npmle(D1,D2);
contour(Theta1,Theta2,g);
points(theta1,theta2);




