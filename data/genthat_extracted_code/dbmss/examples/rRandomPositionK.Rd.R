library(dbmss)


### Name: rRandomPositionK
### Title: Simulations of a point pattern according to the null hypothesis
###   of random position defined for K
### Aliases: rRandomPositionK

### ** Examples

# Simulate a point pattern with two types
X <- rpoispp(5) 
PointType   <- sample(c("A", "B"), X$n, replace=TRUE)
PointWeight <- runif(X$n, min=1, max=10)
X$marks <- data.frame(PointType, PointWeight)
X <- as.wmppp(X)

par(mfrow=c(1,2))
plot(X, main="Original pattern, Point Type")

# Randomize it
Y <- rRandomPositionK(X)
# Invert the order of columns in mark to plot the point type, not the point weight
Y$marks <- data.frame(Y$marks$PointType, Y$marks$PointWeight)
# Points are randomly distributed
plot(Y, main="Randomized pattern, Point Type")



