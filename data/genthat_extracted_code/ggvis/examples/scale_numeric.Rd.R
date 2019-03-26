library(ggvis)


### Name: scale_numeric
### Title: Add a numeric scale to a ggvis object.
### Aliases: scale_numeric

### ** Examples

p <- mtcars %>% ggvis(~wt, ~mpg, fill = ~hp) %>% layer_points()

p %>% scale_numeric("y")

p %>% scale_numeric("y", trans = "pow", exponent = 0.5)

p %>% scale_numeric("y", trans = "log")

# Can control other properties other than x and y
p %>% scale_numeric("fill", domain = c(0, 120), clamp = TRUE)

# Set range of data from 0 to 3
p %>% scale_numeric("x", domain = c(0, 3), clamp = TRUE, expand = 0,
                     nice = FALSE)

# Lower bound is set to lower limit of data, upper bound set to 3.
p %>% scale_numeric("x", domain = c(NA, 3), clamp = TRUE, nice = FALSE)



