library(ggpmisc)


### Name: stat_fit_residuals
### Title: Residuals from a model fit
### Aliases: stat_fit_residuals

### ** Examples

library(ggplot2)
# generate artificial data
set.seed(4321)
x <- 1:100
y <- (x + x^2 + x^3) + rnorm(length(x), mean = 0, sd = mean(x^3) / 4)
my.data <- data.frame(x, y, group = c("A", "B"), y2 = y * c(0.5,2))
# give a name to a formula
my.formula <- y ~ poly(x, 3, raw = TRUE)
# plot
ggplot(my.data, aes(x, y)) +
  stat_fit_residuals(formula = my.formula, resid.type = "working")




