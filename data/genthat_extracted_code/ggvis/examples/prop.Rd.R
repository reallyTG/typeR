library(ggvis)


### Name: prop
### Title: Create a property.
### Aliases: prop is.prop is.prop_constant is.prop_variable
###   is.prop_reactive

### ** Examples

prop("x", 1)
prop("x", ~1)
prop("fill", quote(cyl))
prop("fill", ~cyl)
prop("x", input_slider(0, 100))

# If you have a variable name as a string
var <- "cyl"
prop("x", as.name(var))

# Use a custom scale
prop("y", quote(cyl), scale = "y-2")

# Don't scale variable (i.e. it already makes sense in the visual space)
prop("fill", ~colour, scale = FALSE)

# Use a constant, but scaled
prop("x", 5, scale = TRUE)

# Use other events
prop("y", quote(cyl), scale = "y-2")




