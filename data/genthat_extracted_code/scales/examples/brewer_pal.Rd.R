library(scales)


### Name: brewer_pal
### Title: Colour Brewer palette (discrete).
### Aliases: brewer_pal

### ** Examples

show_col(brewer_pal()(10))
show_col(brewer_pal("div")(5))
show_col(brewer_pal(palette = "Greens")(5))

# Can use with gradient_n to create a continous gradient
cols <- brewer_pal("div")(5)
show_col(gradient_n_pal(cols)(seq(0, 1, length.out = 30)))



