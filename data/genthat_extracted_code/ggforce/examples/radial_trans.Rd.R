library(ggforce)


### Name: radial_trans
### Title: Create radial data in a cartesian coordinate system
### Aliases: radial_trans

### ** Examples

# Some data in radial form
rad <- data.frame(r = seq(1, 10, by = 0.1), a = seq(1, 10, by = 0.1))

# Create a transformation
radial <- radial_trans(c(0, 1), c(0, 5))

# Get data in x, y
cart <- radial$transform(rad$r, rad$a)

# Have a look
ggplot() +
  geom_path(aes(x = x, y = y), data = cart, color = 'forestgreen') +
  geom_path(aes(x = r, y = a), data = rad, color = 'firebrick')



