library(ggforce)


### Name: power_trans
### Title: Create a power transformation object
### Aliases: power_trans

### ** Examples

# Power of 5 transformations
trans <- power_trans(2)
trans$transform(1:10)

# Cubic root transformation
trans <- power_trans(1 / 3)
trans$transform(1:10)

# Use it in a plot
ggplot() +
  geom_line(aes(x = 1:10, y = 1:10)) +
  scale_x_continuous(trans = power_trans(2),
                     expand = c(0, 1))



