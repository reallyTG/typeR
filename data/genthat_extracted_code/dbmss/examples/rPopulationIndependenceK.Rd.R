library(dbmss)


### Name: rPopulationIndependenceK
### Title: Simulations of a point pattern according to the null hypothesis
###   of population independence defined for K
### Aliases: rPopulationIndependenceK

### ** Examples

# Simulate a point pattern with two types
X <- rpoispp(50) 
PointType   <- sample(c("A", "B"), X$n, replace=TRUE)
PointWeight <- runif(X$n, min=1, max=10)
X$marks <- data.frame(PointType, PointWeight)
X <- as.wmppp(X)

par(mfrow=c(1,2))
# Plot the point pattern, using PointType as marks
plot(X, main="Original pattern, Point Type", which.marks=2)

# Randomize it
Y <- rPopulationIndependenceK(X, "A", "B")
# Points of type "A" are unchanged, points of type "B" have been moved altogether
plot(Y, main="Randomized pattern, Point Type", which.marks=2)



