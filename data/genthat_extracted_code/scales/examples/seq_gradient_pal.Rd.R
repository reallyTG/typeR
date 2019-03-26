library(scales)


### Name: seq_gradient_pal
### Title: Sequential colour gradient palette (continuous).
### Aliases: seq_gradient_pal

### ** Examples

x <- seq(0, 1, length.out = 25)
show_col(seq_gradient_pal()(x))
show_col(seq_gradient_pal("white", "black")(x))

library(munsell)
show_col(seq_gradient_pal("white", mnsl("10R 4/6"))(x))



