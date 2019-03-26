library(Momocs)


### Name: coo_shearx
### Title: Shears shapes
### Aliases: coo_shearx coo_sheary

### ** Examples

coo <- coo_template(shapes[11])
coo_plot(coo)
coo_draw(coo_shearx(coo, 0.5), border="blue")
coo_draw(coo_sheary(coo, 0.5), border="red")




