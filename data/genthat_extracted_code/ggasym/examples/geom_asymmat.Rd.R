library(ggasym)


### Name: geom_asymmat
### Title: Asymmetrically filled symmetric matrix (using 'ggplot2')
### Aliases: geom_asymmat

### ** Examples

library(tibble)
library(ggplot2)
suppressMessages(library(dplyr))
tib <- tibble(g1 = c("A", "A", "B"),
              g2 = c("B", "C", "C"),
              val_1 = c(1, 2, 3),
              val_2 = c(-1, 0, 1))

tib

tib <- asymmetrise(tib, g1, g2)
tib$val_3 <- NA
tib$val_3[tib$g1 == tib$g2] <- c(1, 2, 3)
ggplot(tib, aes(x = g1, y = g2)) +
    geom_asymmat(aes(fill_tl = val_1, fill_br = val_2, fill_diag = val_3)) +
    scale_fill_br_gradient(low = "lightblue1", high = "dodgerblue") +
    scale_fill_tl_gradient(low = "lightpink", high = "tomato") +
    scale_fill_diag_gradient(low = "aquamarine", high = "forestgreen") +
    labs(fill_tl =  "top-left fill", fill_br = "bottom-right fill")




