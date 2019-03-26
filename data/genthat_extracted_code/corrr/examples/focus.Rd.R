library(corrr)


### Name: focus
### Title: Focus on section of a correlation data frame.
### Aliases: focus focus_

### ** Examples

library(dplyr)
x <- correlate(mtcars)
focus(x, mpg, cyl)  # Focus on correlations of mpg and cyl with all other variables
focus(x, -disp, - mpg, mirror = TRUE)  # Remove disp and mpg from columns and rows

x <- correlate(iris[-5])
focus(x, -matches("Sepal"))  # Focus on correlations of non-Sepal 
                             # variables with Sepal variables.



