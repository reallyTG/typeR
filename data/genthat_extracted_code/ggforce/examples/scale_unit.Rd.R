library(ggforce)


### Name: scale_unit
### Title: Position scales for units data
### Aliases: scale_x_unit scale_y_unit scale_type.units

### ** Examples

library(units)
gallon <- as_units('gallon')
mtcars$consumption <- mtcars$mpg * with(ud_units, mi / gallon)
mtcars$power <- mtcars$hp * with(ud_units, hp)

# Use units encoded into the data
ggplot(mtcars) +
  geom_point(aes(power, consumption))

# Convert units on the fly during plotting
ggplot(mtcars) +
  geom_point(aes(power, consumption)) +
  scale_x_unit(unit = 'W') +
  scale_y_unit(unit = 'km/l')

# Resolve units when transforming data
ggplot(mtcars) +
  geom_point(aes(power, 1 / consumption))



