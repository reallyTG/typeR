library(NormalGamma)


### Name: dnormgam
### Title: Normal-gamma density
### Aliases: dnormgam
### Keywords: normal gamma convolution density

### ** Examples


## Example 1

par = c(-10, 5, 2, 20)
F = dnormgam(par)

## Example 2 

n = 50000
par = c(60,5,0.15,400)
F = dnormgam(par, plot=FALSE)

X = rnorm(n, mean=par[1], sd=par[2]) + rgamma(n, shape=par[3], scale=par[4]) 
H = histogram(X, type='irregular', verbose=FALSE, plot=FALSE)
plot(H, xlim=c(0,500))
lines(F$xout, F$dout, col='red')




