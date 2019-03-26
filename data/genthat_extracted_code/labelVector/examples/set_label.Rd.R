library(labelVector)


### Name: set_label
### Title: Set the label of an atomic vector
### Aliases: set_label set_label.default set_label.data.frame

### ** Examples

x <- 1:10
x <- set_label(x, "Integers")
x

# Set labels for variables in a data frame

mtcars2 <-
  set_label(mtcars,
            am = "Automatic / Manual",
            mpg = "Miles per Gallon",
            gear = "Number of gears")

get_label(mtcars2)




