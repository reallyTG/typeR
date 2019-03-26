library(mrfDepth)


### Name: rdepth
### Title: Regression depth of hyperplanes
### Aliases: rdepth
### Keywords: regression

### ** Examples

# Illustrate the concept of regression depth in the case of simple 
# linear regression. 

data("stars")

# Compute the least squares fit. Due to outliers
# this fit will be bad and thus should result in a small
# regression depth.
temp <- lsfit(x = stars[,1], y = stars[,2])$coefficients
intercept <- temp[1]
slope <- temp[2]
plot(stars, ylim = c(4,7))
abline(a = intercept, b = slope)
abline(a = -9.2, b = 3.2, col = "red")

# Let us compare the regression depth of the least squares fit
# with the depth of the better fitting red regression line.
z <- rbind(cbind(intercept, slope),
           cbind(-9.2, 3.2))
result <- rdepth(x = stars, z = z)
result$depthZ
text(x = 3.8, y = 5.3, labels = round(result$depthZ[1], digits =2))
text(x = 4.45, y = 4.8, labels = round(result$depthZ[2], digits =2), col = "red")

# Compute the depth of some other regression lines to illustrate the concept.
# Note that the stars data set has 47 observations and 1/47 = 0.0212766.
z <- rbind(cbind(6.2, 0),
           cbind(6.5, 0))
result <- rdepth(x = stars, z = z)
abline(a = 6.2, b = 0, col = "blue")
abline(a = 6.5, b = 0, col = "darkgreen")
text(x = 3.8, y = 6.25, labels = round(result$depthZ[1], digits =2), col = "blue")
text(x = 4, y = 6.55, labels = round(result$depthZ[2], digits =2), col = "darkgreen")
# One point needs to removed to make the blue line a nonfit. The green line is clearly
# a nonfit. 



