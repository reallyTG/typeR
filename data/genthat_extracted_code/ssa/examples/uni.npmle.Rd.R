library(ssa)


### Name: uni.npmle
### Title: Univariate NPMLE
### Aliases: uni.npmle

### ** Examples

## generate parameters from mixing distribution
p <- 1000;
set.seed(1); theta <- rnorm(p);
## generate observed variables
X <- rnorm(p,theta,1);
## set grid points
d <- 25;
Theta <- seq(min(X),max(X),length=d);
## calculate D matrix
D <- outer(X,Theta,function(x,y){
  dnorm(x,y,1);
});
## fit npmle
g <- uni.npmle(D);
plot(Theta,g/sum(g*(Theta[2]-Theta[1])),type="l");
lines(Theta,dnorm(Theta),col="red");




