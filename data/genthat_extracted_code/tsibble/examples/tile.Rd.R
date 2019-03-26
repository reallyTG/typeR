library(tsibble)


### Name: tile
### Title: Tiling window calculation
### Aliases: tile tile_dfr tile_dfc tile_lgl tile_chr tile_dbl tile_int

### ** Examples

x <- 1:5
lst <- list(x = x, y = 6:10, z = 11:15)
tile_dbl(x, mean, .size = 2)
tile_lgl(x, ~ mean(.) > 2, .size = 2)
tile(lst, ~ ., .size = 2)



