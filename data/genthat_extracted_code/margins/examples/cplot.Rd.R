library(margins)


### Name: cplot
### Title: Conditional predicted value and average marginal effect plots
###   for models
### Aliases: cplot cplot.lm cplot.clm cplot.glm cplot.loess cplot.polr
###   cplot.multinom
### Keywords: graphics

### ** Examples

## Not run: 
##D require('datasets')
##D # prediction from several angles
##D m <- lm(Sepal.Length ~ Sepal.Width, data = iris)
##D cplot(m)
##D 
##D # more complex model
##D m <- lm(Sepal.Length ~ Sepal.Width * Petal.Width * I(Petal.Width ^ 2), 
##D         data = head(iris, 50))
##D ## marginal effect of 'Petal.Width' across 'Petal.Width'
##D cplot(m, x = "Petal.Width", what = "effect", n = 10)
##D 
##D # factor independent variables
##D mtcars[["am"]] <- factor(mtcars[["am"]])
##D m <- lm(mpg ~ am * wt, data = mtcars)
##D ## predicted values for each factor level
##D cplot(m, x = "am")
##D ## marginal effect of each factor level across numeric variable
##D cplot(m, x = "wt", dx = "am", what = "effect")
##D 
##D # marginal effect of 'Petal.Width' across 'Sepal.Width'
##D ## without drawing the plot
##D ## this might be useful for using, e.g., ggplot2 for plotting
##D tmp <- cplot(m, x = "Sepal.Width", dx = "Petal.Width", 
##D              what = "effect", n = 10, draw = FALSE)
##D if (require("ggplot2")) {
##D   # use ggplot2 instead of base graphics
##D   ggplot(tmp, aes(x = Petal.Width, y = "effect")) + 
##D          geom_line(lwd = 2) + 
##D          geom_line(aes(y = effect + 1.96*se.effect)) + 
##D          geom_line(aes(y = effect - 1.96*se.effect))
##D }
##D # a non-linear model
##D m <- glm(am ~ wt*drat, data = mtcars, family = binomial)
##D cplot(m, x = "wt") # prediction
##D 
##D # effects on linear predictor and outcome
##D cplot(m, x = "drat", dx = "wt", what = "effect", type = "link")
##D cplot(m, x = "drat", dx = "wt", what = "effect", type = "response")
##D 
##D # plot conditional predictions across a third factor
##D local({
##D   iris$long <- rbinom(nrow(iris), 1, 0.6)
##D   x <- glm(long ~ Sepal.Width*Species, data = iris)
##D   cplot(x, x = "Sepal.Width", data = iris[iris$Species == "setosa", ], 
##D         ylim = c(0,1), col = "red", se.fill = rgb(1,0,0,.5), xlim = c(2,4.5))
##D   cplot(x, x = "Sepal.Width", data = iris[iris$Species == "versicolor", ], 
##D         draw = "add", col = "blue", se.fill = rgb(0,1,0,.5))
##D   cplot(x, x = "Sepal.Width", data = iris[iris$Species == "virginica", ], 
##D         draw = "add", col = "green", se.fill = rgb(0,0,1,.5))
##D })
##D 
##D # ordinal outcome
##D if (require("MASS")) {
##D   # x is a factor variable
##D   house.plr <- polr(Sat ~ Infl + Type + Cont, weights = Freq, 
##D                     data = housing)
##D   ## predicted probabilities
##D   cplot(house.plr)
##D   ## cumulative predicted probabilities
##D   cplot(house.plr, what = "stacked")
##D   ## ggplot2 example
##D   if (require("ggplot2")) {
##D     ggplot(cplot(house.plr), aes(x = xvals, y = yvals, group = level)) + 
##D       geom_line(aes(color = level))
##D   }
##D 
##D   # x is continuous
##D   cyl.plr <- polr(factor(cyl) ~ wt, data = mtcars)
##D   cplot(cyl.plr, col = c("red", "purple", "blue"), what = "stacked")
##D   cplot(cyl.plr, what = "class")
##D }
##D 
## End(Not run)



