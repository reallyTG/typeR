library(Directional)


### Name: Prediction in discriminant analysis based on ESAG distribution
### Title: Prediction of a new observation using discriminant analysis
###   based on ESAGdistribution
### Aliases: ESAGda.pred
### Keywords: Discriminant analysis Von Mises-Fisher distributions

### ** Examples

m1 <- rnorm(3)
m2 <- rnorm(3) + 0.5
y <- rbind( rvmf(100, m1, 3), rvmf(80, m2, 5) )
ina <- c( rep(1,100), rep(2, 80) )
ynew <- rbind(rvmf(10, m1, 10), rvmf(10, m2, 5))
id <- rep(1:2, each = 10)
g <- ESAGda.pred(ynew, y, ina)
table(id, g)



