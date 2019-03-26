library(ggvis)


### Name: input_slider
### Title: Create an interactive slider.
### Aliases: input_slider

### ** Examples

input_slider(0, 100)
input_slider(0, 100, label = "binwidth")
input_slider(0, 100, value = 50)

# Supply two values to value to make a double-ended sliders
input_slider(0, 100, c(25, 75))

# You can use map to transform the outputs
input_slider(-5, 5, label = "Log scale", map = function(x) 10 ^ x)



