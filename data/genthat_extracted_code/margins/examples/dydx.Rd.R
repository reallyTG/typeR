library(margins)


### Name: dydx
### Title: Marginal Effect of a Given Variable
### Aliases: dydx dydx.default dydx.factor dydx.ordered dydx.logical

### ** Examples

require("datasets")
x <- lm(mpg ~ cyl * hp + wt, data = head(mtcars))
# marginal effect (numerical derivative)
dydx(head(mtcars), x, "hp")

# other discrete differences
## change from min(mtcars$hp) to max(mtcars$hp)
dydx(head(mtcars), x, "hp", change = "minmax")
## change from 1st quartile to 3rd quartile
dydx(head(mtcars), x, "hp", change = "iqr")
## change from mean(mtcars$hp) +/- sd(mtcars$hp)
dydx(head(mtcars), x, "hp", change = "sd")
## change between arbitrary values of mtcars$hp
dydx(head(mtcars), x, "hp", change = c(75,150))

# factor variables
mtcars[["cyl"]] <- factor(mtcars$cyl)
x <- lm(mpg ~ cyl, data = head(mtcars))
dydx(head(mtcars), x, "cyl")




