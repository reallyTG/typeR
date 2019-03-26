library(rgl)


### Name: ellipse3d
### Title: Make an ellipsoid
### Aliases: ellipse3d ellipse3d.default ellipse3d.lm ellipse3d.glm
###   ellipse3d.nls
### Keywords: dplot

### ** Examples

# Plot a random sample and an ellipsoid of concentration corresponding to a 95% 
# probability region for a
# trivariate normal distribution with mean 0, unit variances and 
# correlation 0.8.
if (requireNamespace("MASS")) {
  Sigma <- matrix(c(10, 3, 0, 3, 2, 0, 0, 0, 1), 3, 3)
  Mean <- 1:3
  x <- MASS::mvrnorm(1000, Mean, Sigma)
  
  open3d()
  
  plot3d(x, box = FALSE)
  
  plot3d( ellipse3d(Sigma, centre = Mean), col = "green", alpha = 0.5, add = TRUE)
}  

# Plot the estimate and joint 90% confidence region for the displacement and cylinder
# count linear coefficients in the mtcars dataset

data(mtcars)
fit <- lm(mpg ~ disp + cyl , mtcars)

open3d()
plot3d(ellipse3d(fit, level = 0.90), col = "blue", alpha = 0.5, aspect = TRUE)



