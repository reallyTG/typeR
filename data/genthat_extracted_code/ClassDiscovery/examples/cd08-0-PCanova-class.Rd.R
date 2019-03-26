library(ClassDiscovery)


### Name: PCanova
### Title: Class "PCanova"
### Aliases: PCanova PCanova-class plot,PCanova,missing-method
###   pltree,PCanova-method summary,PCanova-method
### Keywords: classes multivariate

### ** Examples

showClass("PCanova")

## simulate data from three groups
d1 <- matrix(rnorm(100*10, rnorm(100, 0.5)), nrow=100, ncol=10, byrow=FALSE)
d2 <- matrix(rnorm(100*10, rnorm(100, 0.5)), nrow=100, ncol=10, byrow=FALSE)
d3 <- matrix(rnorm(100*10, rnorm(100, 0.5)), nrow=100, ncol=10, byrow=FALSE)
dd <- cbind(d1, d2, d3)
## colors that match the groups
cols <- rep(c('red', 'green', 'blue'), each=10)

## compute the PCanova object
pan <- PCanova(dd, c('red', 'green', 'blue'), cols, cols)
summary(pan)

## view the PC plots
plot(pan)

## view the dendrograms
pltree(pan, line=-0.5)

## compare the results when there is no underlying group structure
dd <- matrix(rnorm(100*50, rnorm(100, 0.5)), nrow=100, ncol=50, byrow=FALSE)
cols <- rep(c('red', 'green', 'blue', 'orange', 'cyan'), each=10)
pan <- PCanova(dd, unique(cols), cols, cols)
plot(pan, mscale=1/sqrt(10))

pltree(pan, line=-0.5)

## cleanup
rm(d1, d2, d3, dd, cols, pan)



