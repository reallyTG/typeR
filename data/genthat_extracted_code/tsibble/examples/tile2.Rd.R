library(tsibble)


### Name: tile2
### Title: Tiling window calculation over multiple inputs simultaneously
### Aliases: tile2 tile2_dfr tile2_dfc ptile ptile_dfr ptile_dfc tile2_lgl
###   tile2_chr tile2_dbl tile2_int ptile_lgl ptile_chr ptile_dbl ptile_int

### ** Examples

x <- 1:5
y <- 6:10
z <- 11:15
lst <- list(x = x, y = y, z = z)
df <- as.data.frame(lst)
tile2(x, y, sum, .size = 2)
tile2(lst, lst, ~ ., .size = 2)
tile2(df, df, ~ ., .size = 2)
ptile(lst, sum, .size = 1)
ptile(list(lst, lst), ~ ., .size = 2)



