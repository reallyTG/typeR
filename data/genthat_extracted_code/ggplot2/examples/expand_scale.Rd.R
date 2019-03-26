library(ggplot2)


### Name: expand_scale
### Title: Generate expansion vector for scales.
### Aliases: expand_scale

### ** Examples

# No space below the bars but 10% above them
ggplot(mtcars) +
  geom_bar(aes(x = factor(cyl))) +
  scale_y_continuous(expand = expand_scale(mult = c(0, .1)))

# Add 2 units of space on the left and right of the data
ggplot(subset(diamonds, carat > 2), aes(cut, clarity)) +
  geom_jitter() +
  scale_x_discrete(expand = expand_scale(add = 2))

# Reproduce the default range expansion used
# when the ‘expand’ argument is not specified
ggplot(subset(diamonds, carat > 2), aes(cut, price)) +
  geom_jitter() +
  scale_x_discrete(expand = expand_scale(add = .6)) +
  scale_y_continuous(expand = expand_scale(mult = .05))



