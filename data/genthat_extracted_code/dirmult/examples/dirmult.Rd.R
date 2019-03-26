library(dirmult)


### Name: dirmult
### Title: Parameter estimation in Dirichlet-multinomial distribution
### Aliases: dirmult

### ** Examples

data(us)
fit <- dirmult(us[[1]],epsilon=10^(-4),trace=FALSE)
dirmult.summary(us[[1]],fit)



