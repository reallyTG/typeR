library(GMCM)


### Name: as.theta
### Title: Coerce a list to a theta object
### Aliases: as.theta

### ** Examples

m <- 2
d <- 2
x <- list(m = m,
          d = d,
          pie = c(0.5, 0.5),
          mu = list(comp1=rep(0,d), comp2=rep(1,d)),
          sigma = list(comp1=diag(d), comp2=diag(d)))
print(x)
theta <- as.theta(x)
print(theta)



