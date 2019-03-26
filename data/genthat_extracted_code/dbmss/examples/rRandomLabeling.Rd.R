library(dbmss)


### Name: rRandomLabeling
### Title: Simulations of a point pattern according to the null hypothesis
###   of random labeling
### Aliases: rRandomLabeling

### ** Examples

# Simulate a point pattern with five types
X <- rpoispp(50) 
PointType   <- sample(c("A", "B", "C", "D", "E"), X$n, replace=TRUE)
PointWeight <- runif(X$n, min=1, max=10)
X$marks <- data.frame(PointType, PointWeight)
X <- as.wmppp(X)

par(mfrow=c(2,2))
plot(X, main="Original pattern, Point Type", which.marks=2)
plot(X, main="Original pattern, Point Weight", which.marks=1)

# Randomize it
Y <- rRandomLabeling(X)
Z <- Y
# Types have been redistributed randomly across locations
plot(Y, main="Randomized pattern, Point Type", which.marks=2)
# weights too
Y <- Z
plot(Y, main="Randomized pattern, Point Weight", which.marks=1)



