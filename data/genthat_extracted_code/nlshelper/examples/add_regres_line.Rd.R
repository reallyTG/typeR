library(nlshelper)


### Name: add_regres_line
### Title: Add a regression line and confidence band to a plot
### Aliases: add_regres_line

### ** Examples


#'Add a line across the range of the data from a regression object
with(mtcars, plot(1/wt, mpg, xlim=c(0,0.8), ylim=c(0,40)))

# add_regres_line does not allow I() expressions; yet.
mtcars$inv_wt <- 1 / mtcars$wt
fit <- lm(mpg ~ inv_wt, data=mtcars)
add_regres_line(fit)

# Add the regression line and confidence band behind the data
fit <- lm(height ~ age, data=Loblolly)
with(Loblolly, plot(age, height, pch=19, panel.first=add_regres_line(fit)))



