library(Momocs)


### Name: coo_flipx
### Title: Flips shapes
### Aliases: coo_flipx coo_flipy

### ** Examples

cat <- shapes[4]
cat <- coo_center(cat)
coo_plot(cat)
coo_draw(coo_flipx(cat), border="red")
coo_draw(coo_flipy(cat), border="blue")

#' # to flip an entire Coo:
shapes2 <- shapes
shapes$coo <- lapply(shapes2$coo, coo_flipx)



