library(ggplot2)


### Name: scale_colour_continuous
### Title: Continuous colour scales
### Aliases: scale_colour_continuous scale_fill_continuous

### ** Examples

v <- ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
geom_tile()
v

v + scale_fill_continuous(type = "gradient")
v + scale_fill_continuous(type = "viridis")

# The above are equivalent to
v + scale_fill_gradient()
v + scale_fill_viridis_c()



