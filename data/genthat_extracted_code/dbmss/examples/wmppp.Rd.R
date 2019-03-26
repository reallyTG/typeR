library(dbmss)


### Name: wmppp
### Title: Create a Weighted, Marked, Planar Point Pattern
### Aliases: wmppp

### ** Examples

# Draw the coordinates of 10 points
X <- runif(10)
Y <- runif(10)
# Draw the point types.
PointType   <- sample(c("A", "B"), 10, replace=TRUE)
# Plot the point pattern. Weights are set to 1 ant the window is adjusted.
plot(wmppp(data.frame(X, Y, PointType)), , which.marks=2)



