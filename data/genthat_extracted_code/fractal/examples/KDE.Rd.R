library(fractal)


### Name: KDE
### Title: Nonparametric multidimensional probability density function
###   estimation
### Aliases: KDE eda.plot.KDE plot.KDE print.KDE
### Keywords: multivariate distribution

### ** Examples

## create a mixture of 2-D Gaussian distributed 
## RVs with different means, standard 
## deviations, point density, and orientation. 
n.sample <- c(1000, 500, 300)
ind      <- rep(1:3, n.sample)
x <- rmvnorm(sum(n.sample),
    mean = rbind(c(-10,-20), c(10,0), c(0,0))[ ind, ],
    sd   = rbind(c(5,3), c(1,3) , c(0.3,1))[ ind, ],
    rho  = c(0.5, 1, -0.4)[ind])

## perform the KDE 
z <- KDE(x)
print(z)

## plot a summary of the results 
eda.plot(z)

## form KDE of beamchaos series 
plot(KDE(beamchaos),type="l")



