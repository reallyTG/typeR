library(PEIP)


### Name: irls
### Title: Iteratively reweight least squares
### Aliases: irls
### Keywords: misc

### ** Examples

t = 1:10
y=c(109.3827,187.5385,267.5319,331.8753,386.0535,
428.4271,452.1644,498.1461,512.3499,512.9753)
sigma = rep(8, length(y))
N=length(t);

### % Introduce the outlier
y[4]=y[4]-200;

G = cbind( rep(1, N), t, -1/2*t^2 )

### % Apply the weighting

yw = y/sigma;

Gw = G/sigma

m2 = solve( t(Gw) %*% Gw , t(Gw) %*% yw, tol=1e-12 )


###  Solve for the 1-norm solution

m1 = irls(Gw,yw,1.0e-5,1.0e-5,1,25)
m1






