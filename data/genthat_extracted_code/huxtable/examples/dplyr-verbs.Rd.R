library(huxtable)


### Name: mutate.huxtable
### Title: Dplyr verbs for huxtable
### Aliases: mutate.huxtable mutate dplyr-verbs

### ** Examples

ht <- hux(a = 1:5, b = 1:5, c = 1:5, d = 1:5)
bold(ht)[c(1, 3), ] <- TRUE
bold(ht)[, 1] <- TRUE
ht2 <- dplyr::select(ht, b:c)
ht2
bold(ht2)
ht3 <- dplyr::mutate(ht, x = a + b)
ht3
bold(ht3)
ht4 <- dplyr::mutate(ht, x = a + b,
      copy_cell_props = FALSE)
bold(ht4)



