library(conf)


### Name: crplot
### Title: Plotting Two-Dimensional Confidence Regions
### Aliases: crplot
### Keywords: confidence data estimation, graphical graphics, intervals,
###   methods, numerical optimization parameter region, statistical
###   visualization,

### ** Examples

## plot the 95% confidence region for Weibull shape and scale parameters
## corresponding to the given ballbearing dataset
ballbearing <- c(17.88, 28.92, 33.00, 41.52, 42.12, 45.60, 48.48, 51.84,
                 51.96, 54.12, 55.56, 67.80, 68.64, 68.64, 68.88, 84.12,
                 93.12, 98.64, 105.12, 105.84, 127.92, 128.04, 173.40)
crplot(dataset = ballbearing, distn = "weibull", alpha = 0.05)

## repeat this plot using the elliptic-oriented point distribution heuristic
crplot(dataset = ballbearing, distn = "weibull", alpha = 0.05,
       heuristic = 0, ellipse_n = 80)

## combine the two heuristics, compensating any elliptic-oriented point verticies whose apparent
## angles > 6 degrees with additional points, and expand the plot area to include the origin
crplot(dataset = ballbearing, distn = "weibull", alpha = 0.05,
       maxdeg = 6, ellipse_n = 80, origin = TRUE)

## next use the inverse Gaussian distribution and show no plot points
crplot(dataset = ballbearing, distn = "invgauss", alpha = 0.05,
       pts = FALSE)



