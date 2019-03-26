library(car)


### Name: carPalette
### Title: Set or Retrieve 'car' Package Color Palette
### Aliases: carPalette
### Keywords: color

### ** Examples

# Standard color palette
palette()
# car standard color palette
carPalette()
# set colors to all black
carPalette(rep("black", 8))
# Use a custom color palette with 12 distinct colors
carPalette(sample(colors(distinct=TRUE), 12))
# restore default
carPalette("default")



