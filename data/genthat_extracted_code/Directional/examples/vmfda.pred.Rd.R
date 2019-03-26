library(Directional)


### Name: Prediction in discriminant analysis based on von Mises-Fisher distribution
### Title: Prediction of a new observation using discriminant analysis
###   based on von Mises-Fisher distribution
### Aliases: vmfda.pred
### Keywords: Discriminant analysis Von Mises-Fisher distributions

### ** Examples

m1 <- rnorm(5)
m2 <- rnorm(5)
x <- rbind( rvmf(100, m1, 5), rvmf(80, m2, 10) )
ina <- c( rep(1,100), rep(2, 80) )
y <- rbind(rvmf(10, m1, 10), rvmf(10, m2, 5))
id <- rep(1:2, each = 10)
g <- vmfda.pred(y, x, ina)
table(id, g)



