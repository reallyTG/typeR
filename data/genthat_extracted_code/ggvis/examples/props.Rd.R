library(ggvis)


### Name: props
### Title: Manage a list of properties.
### Aliases: props is.ggvis_props

### ** Examples

# Set to constant values
props(x := 1, y := 2)
# Map to variables in the dataset
props(x = ~mpg, y = ~cyl)
# Set to a constant value in the data space
props(x = 1, y = 1)
# Use an interactive slider
props(opacity := input_slider(0, 1))

# To control other settings (like custom scales, mult and offset)
# use a prop object
props(prop("x", "old", scale = "x", offset = -1))

# Red when hovered over, black otherwise (these are equivalent)
props(fill := "black", fill.hover := "red")
props(fill.update := "black", fill.hover := "red")

# Use a column called id as the key (for dynamic data)
props(key := ~id)

# Explicitly create prop objects. The following are equivalent:
props(fill = ~cyl)
props(fill.update = ~cyl)
props(prop("fill", ~cyl))
props(prop("fill", ~cyl, scale = "fill", event = "update"))

# Prop objects can be programmatically created and added:
property <- "fill"
expr <- parse(text = "wt/mpg")[[1]]
p <- prop(property, expr)
props(p)

# Using .props
props(.props = list(x = 1, y = 2))
props(.props = list(x = ~mpg, y = ~cyl))
props(.props = list(quote(x := ~mpg)))



