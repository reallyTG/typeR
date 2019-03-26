library(BayesianTools)


### Name: GOF
### Title: Standard GOF metrics Startvalues for sampling with nrChains > 1
###   : if you want to provide different start values for the different
###   chains, provide a list
### Aliases: GOF

### ** Examples


x = runif(500,-1,1)
y = 0.2 + 0.9  *x + rnorm(500, sd = 0.5)

summary(lm(y ~ x))

GOF(x,y)

GOF(x,y, plot = TRUE)



