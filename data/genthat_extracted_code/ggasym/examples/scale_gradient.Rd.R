library(ggasym)


### Name: scale_gradient
### Title: Gradient colour scales geom_asymmat
### Aliases: scale_gradient scale_fill_tl_gradient scale_fill_br_gradient
###   scale_fill_diag_gradient scale_fill_tl_gradient2
###   scale_fill_br_gradient2 scale_fill_diag_gradient2
###   scale_fill_tl_gradientn scale_fill_br_gradientn
###   scale_fill_diag_gradientn scale_fill_tl_distiller
###   scale_fill_br_distiller scale_fill_diag_distiller

### ** Examples

library(tibble)
library(ggplot2)
set.seed(0)

tib <- tibble(g1 = c("A", "A", "A", "B", "B", "C", "A", "B", "C", "D"),
              g2 = c("B", "C", "D", "C", "D", "D", "A", "B", "C", "D"),
              val_1 = c(1:10),
              val_2 = sample(-10:10, 10),
              val_3 = c(rep(NA, 6), 1, 2, 3, 4))
tib <- asymmetrise(tib, g1, g2)
g <- ggplot(tib, aes(x = g1, y = g2)) +
    geom_asymmat(aes(fill_tl = val_1, fill_br = val_2, fill_diag = val_3))

g + scale_fill_tl_gradient(low = "lightpink", high = "tomato") +
    scale_fill_br_gradient(low = "lightblue", high = "dodgerblue") +
    scale_fill_diag_gradient(low = "yellow", high = "orange3")

g + scale_fill_tl_gradient2(low = "dodgerblue",
                            mid = "white", midpoint = 5,
                            high = "tomato") +
    scale_fill_br_gradient2(low = "seagreen4",
                            mid = "white", midpoint = 0,
                            high = "orange") +
    scale_fill_diag_gradient2(low = "magenta",
                              mid = "cornflowerblue", midpoint = 2.5,
                              high = "chartreuse")

g + scale_fill_tl_gradientn(colours = terrain.colors(200)) +
    scale_fill_br_gradientn(colours = heat.colors(200)) +
    scale_fill_diag_gradientn(colours = rainbow(200))

g + scale_fill_tl_distiller(type  = "seq", palette = "Greens") +
    scale_fill_br_distiller(type  = "div", palette = "PuOr") +
    scale_fill_diag_distiller(type  = "seq", palette = "Blues")



