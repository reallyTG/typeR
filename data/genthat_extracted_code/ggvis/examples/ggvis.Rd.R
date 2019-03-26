library(ggvis)


### Name: ggvis
### Title: Visualise a data set with a ggvis graphic.
### Aliases: ggvis

### ** Examples

# If you don't supply a layer, ggvis uses layer_guess() to guess at
# an appropriate type:
mtcars %>% ggvis(~mpg, ~wt)
mtcars %>% ggvis(~mpg, ~wt, fill = ~cyl)
mtcars %>% ggvis(~mpg, ~wt, fill := "red")
mtcars %>% ggvis(~mpg)

# ggvis has a functional interface: every ggvis function takes a ggvis
# an input and returns a modified ggvis as output.
layer_points(ggvis(mtcars, ~mpg, ~wt))

# To make working with this interface more natural, ggvis imports the
# pipe operator from magrittr. x %>% f(y) is equivalent to f(x, y) so
# we can rewrite the previous command as
mtcars %>% ggvis(~mpg, ~wt) %>% layer_points()

# For more complicated plots, add a line break after %>%
mtcars %>%
  ggvis(~mpg, ~wt) %>%
  layer_points() %>%
  layer_smooths()



