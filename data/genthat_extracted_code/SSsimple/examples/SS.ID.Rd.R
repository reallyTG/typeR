library(SSsimple)


### Name: SS.ID
### Title: System Identification
### Aliases: SS.ID
### Keywords: ~kwd1 ~kwd2

### ** Examples

Q <- diag(1/10, 2)
R <- diag(2, 3)
H <- matrix(1, 3, 2)
F <- diag(0.99, 2)

set.seed(9999)
xs <- SS.sim(F, H, Q, R, 2000, rep(0, 2))

## notice that while the parameter estimates appear somewhat inaccurate ...
ssid <- SS.ID( xs$Z , 2,  c(3, 6, 900) ) ; ssid

## the observation estimate:
sss <- SS.solve( xs$Z, ssid$F.hat, ssid$H.hat, ssid$Q.hat, ssid$R.hat, nrow(xs$Z), 10^5, c(0,0)) 
Z.hat <- t( ssid$H.hat %*% t( sss$B.apri ) )
sqrt( mean( (xs$Z - Z.hat)^2 ) )

## is nontheless very close to that using true hyperparameter values:
sss.true <- SS.solve( xs$Z, F, H, Q, R, nrow(xs$Z), 10^5, c(0,0)) 
Z.hat <- t( H %*% t( sss.true$B.apri ) )
sqrt( mean( (xs$Z - Z.hat)^2 ) )



