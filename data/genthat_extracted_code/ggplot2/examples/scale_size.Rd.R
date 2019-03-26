library(ggplot2)


### Name: scale_size
### Title: Scales for area or radius
### Aliases: scale_size scale_size_continuous scale_radius
###   scale_size_discrete scale_size_ordinal scale_size_area
###   scale_size_datetime scale_size_date

### ** Examples

p <- ggplot(mpg, aes(displ, hwy, size = hwy)) +
   geom_point()
p
p + scale_size("Highway mpg")
p + scale_size(range = c(0, 10))

# If you want zero value to have zero size, use scale_size_area:
p + scale_size_area()

# This is most useful when size is a count
ggplot(mpg, aes(class, cyl)) +
  geom_count() +
  scale_size_area()

# If you want to map size to radius (usually bad idea), use scale_radius
p + scale_radius()



