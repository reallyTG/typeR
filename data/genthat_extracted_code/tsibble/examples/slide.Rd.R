library(tsibble)


### Name: slide
### Title: Sliding window calculation
### Aliases: slide slide_dfr slide_dfc slide_lgl slide_chr slide_int
###   slide_dbl

### ** Examples

x <- 1:5
lst <- list(x = x, y = 6:10, z = 11:15)
slide_dbl(x, mean, .size = 2)
slide_dbl(x, mean, .size = 2, align = "center")
slide_lgl(x, ~ mean(.) > 2, .size = 2)
slide(lst, ~ ., .size = 2)



