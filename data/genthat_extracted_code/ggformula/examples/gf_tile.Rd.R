library(ggformula)


### Name: gf_tile
### Title: Formula interface to geom_tile()
### Aliases: gf_tile

### ** Examples

D <- expand.grid(x = 0:5, y = 0:5)
D$z <- runif(nrow(D))
gf_tile(y ~ x, fill = ~ z, data = D)
gf_tile(z ~ x + y, data = D)



