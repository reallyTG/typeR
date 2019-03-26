library(gamlss)


### Name: gen.likelihood
### Title: A function to generate the likelihood function from a GAMLSS
###   object
### Aliases: gen.likelihood
### Keywords: regression

### ** Examples

data(aids)
m1 <- gamlss(y~x+qrt, data=aids, family=NBI)
logL<-gen.likelihood(m1)
logL()
logLik(m1)



