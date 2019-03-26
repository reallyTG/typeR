library(REdaS)


### Name: Density-Box-Plot
### Title: Density-Box-Plots
### Aliases: densbox

### ** Examples

# plot a density-box-plot of one (log-normal) variable
set.seed(5L)
data1 <- rlnorm(100, 1, .5)
densbox(data1 ~ 1, from = 0, rug = TRUE)

# plots a continuous variable in (0, 1) with 2 grouping variables
data2 <- data.frame(y  = rnorm(400, rep(c(0, 1, -1, 0), each = 100), 1),
                    x1 = rep(c("A", "B"), each = 200),
                    x2 = rep(c("X", "Y", "X", "Y"), each = 100))
with(data2, tapply(y, list(x1, x2), mean))

# a density-box-plot of the data with the kernel density
# estimator constrained to the interval 0 to 1
densbox(y ~ x2 + x1, data2, main = "Plot with some\nSpecials",
  var_names = c("Second\nVariable", "First Variable"))

# the same plot with a rug and ignoring outliers in the boxplot
densbox(y ~ x2 + x1, data2, rug = TRUE, box_out = FALSE)

# density-box-plot with the same data, but no additional space between groups
# by setting gsep = 0.
# the kernel density plots have a rectangular kernel with a bandwidth of 0.25
# which results in a "jagged" appearance.
densbox(y ~ x2 + x1, data2, gsep = 0, kernel = "rectangular", bw = 0.25)



