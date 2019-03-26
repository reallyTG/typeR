library(epitrix)


### Name: fit_disc_gamma
### Title: Fit discretised distributions using ML
### Aliases: fit_disc_gamma fit_discrete

### ** Examples


## generate data

mu <- 15.3 # days
sigma <- 9.3 # days
cv <- mu / sigma
cv
param <- gamma_mucv2shapescale(mu, cv)

if (require(distcrete)) {
w <- distcrete("gamma", interval = 1,
               shape = param$shape,
               scale = param$scale, w = 0)

x <- w$r(100)
x

fit_disc_gamma(x)
}




