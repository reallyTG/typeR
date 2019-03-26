library(condvis)


### Name: plotxc
### Title: Condition selector plot
### Aliases: plotxc

### ** Examples

## Histogram, highlighting the first case.

data(mtcars)
obj <- plotxc(mtcars[, "mpg"], mtcars[1, "mpg"])
obj$usr

## Barplot, highlighting 'cyl' = 6.

plotxc(as.factor(mtcars[, "cyl"]), 6, select.colour = "blue")

## Scatterplot, highlighting case 25.

plotxc(mtcars[, c("qsec", "wt")], mtcars[25, c("qsec", "wt")],
  select.colour = "blue", select.lwd = 1, lty = 3)

## Boxplot, where 'xc' contains one factor, and one numeric.

mtcars$carb <- as.factor(mtcars$carb)
plotxc(mtcars[, c("carb", "wt")], mtcars[25, c("carb", "wt")],
  select.colour = "red", select.lwd = 3)

## Spineplot, where 'xc' contains two factors.

mtcars$gear <- as.factor(mtcars$gear)
mtcars$cyl <- as.factor(mtcars$cyl)
plotxc(mtcars[, c("cyl", "gear")], mtcars[25, c("cyl", "gear")],
  select.colour = "red")

## Effect of 'trim'.

x <- c(-200, runif(400), 200)
plotxc(x, 0.5, trim = FALSE, select.colour = "red")
plotxc(x, 0.5, trim = TRUE, select.colour = "red")




