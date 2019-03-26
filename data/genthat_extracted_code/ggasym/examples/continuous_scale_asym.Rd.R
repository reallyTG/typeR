library(ggasym)


### Name: continuous_scale_asym
### Title: Continuous scale constructor for 'ggasym'
### Aliases: continuous_scale_asym

### ** Examples

library(tibble)
library(ggplot2)
tib <- tibble(g1 = c("A", "A", "B"),
              g2 = c("B", "C", "C"),
              val_1 = c(1, 2, 3),
              val_2 = c(-1, 0, 1))

tib

tib <- asymmetrise(tib, g1, g2)
ggplot(tib) +
geom_asymmat(aes(x = g1, y = g2, fill_tl = val_1, fill_br = val_2)) +
    scale_fill_tl_gradient(low = "lightpink", high = "tomato") +
    scale_fill_br_gradient(low = "lightblue1", high = "dodgerblue") +
    labs(fill_tl =  "top-left fill", fill_br = "bottom-right fill")




