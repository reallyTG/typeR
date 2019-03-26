library(labelVector)


### Name: get_label
### Title: Extract Label Attribute From a Labelled Vector
### Aliases: get_label get_label.default get_label.data.frame

### ** Examples

x <- 1:10
x <- set_label(x, "Integers")

get_label(x)

y <- letters
attr(y, "label")    # NULL
get_label(y)        # "y"

# Set labels for variables in a data frame

mtcars2 <-
  set_label(mtcars,
            am = "Automatic / Manual",
            mpg = "Miles per Gallon",
            gear = "Number of gears")

get_label(mtcars2)




