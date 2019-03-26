library(nlshelper)


### Name: abline_range
### Title: Add a line to a plot
### Aliases: abline_range

### ** Examples


# Add a line manually
with(mtcars, plot(1/wt, mpg, xlim=c(0,0.8), ylim=c(0,40)))
abline_range(0,50,from=0.2, to=0.6)

# Add a line across the range of the data from a regression object
with(mtcars, plot(1/wt, mpg, xlim=c(0,0.8), ylim=c(0,40)))
fit <- lm(mpg ~ I(1/wt), data=mtcars)
abline_range(fit)




