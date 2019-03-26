library(ellipse)


### Name: ellipse.lm
### Title: Outline a pairwise confidence region for a linear model fit.
### Aliases: ellipse.lm
### Keywords: dplot regression

### ** Examples

# Plot the estimate and joint 90% confidence region for the displacement and cylinder
# count linear coefficients in the mtcars dataset
data(mtcars)
fit <- lm(mpg ~ disp + cyl , mtcars)
plot(ellipse(fit, which = c('disp', 'cyl'), level = 0.90), type = 'l')
points(fit$coefficients['disp'], fit$coefficients['cyl'])



