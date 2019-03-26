library(dbmss)


### Name: rPopulationIndependenceM
### Title: Simulations of a point pattern according to the null hypothesis
###   of population independence defined for M
### Aliases: rPopulationIndependenceM

### ** Examples

# Simulate a point pattern with five types
X <- rpoispp(50) 
PointType   <- sample(c("A", "B", "C", "D", "E"), X$n, replace=TRUE)
PointWeight <- runif(X$n, min=1, max=10)
X$marks <- data.frame(PointType, PointWeight)
X <- as.wmppp(X)

par(mfrow=c(1,2))
plot(X, main="Original pattern, Point Type", which.marks=2)

# Randomize it
Y <- rPopulationIndependenceM(X, "A")
# Points of type "A" (circles) are unchanged, 
# all other points have been redistributed randomly across locations
plot(Y, main="Randomized pattern, Point Type", which.marks=2)



