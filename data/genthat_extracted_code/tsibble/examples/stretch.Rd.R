library(tsibble)


### Name: stretch
### Title: Stretching window calculation
### Aliases: stretch stretch_dfr stretch_dfc stretch_lgl stretch_chr
###   stretch_dbl stretch_int

### ** Examples

x <- 1:5
lst <- list(x = x, y = 6:10, z = 11:15)
stretch_dbl(x, mean, .size = 2)
stretch_lgl(x, ~ mean(.) > 2, .size = 2)
stretch(lst, ~ ., .size = 2)



