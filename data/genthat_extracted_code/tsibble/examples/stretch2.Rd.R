library(tsibble)


### Name: stretch2
### Title: Stretching window calculation over multiple simultaneously
### Aliases: stretch2 stretch2_dfr stretch2_dfc pstretch pstretch_dfr
###   pstretch_dfc stretch2_lgl stretch2_chr stretch2_dbl stretch2_int
###   pstretch_lgl pstretch_chr pstretch_dbl pstretch_int

### ** Examples

x <- 1:5
y <- 6:10
z <- 11:15
lst <- list(x = x, y = y, z = z)
df <- as.data.frame(lst)
stretch2(x, y, sum, .size = 2)
stretch2(lst, lst, ~ ., .size = 2)
stretch2(df, df, ~ ., .size = 2)
pstretch(lst, sum, .size = 1)
pstretch(list(lst, lst), ~ ., .size = 2)

###
# row-wise stretching over data frame
###

x <- as.Date("2017-01-01") + 0:364
df <- data.frame(x = x, y = seq_along(x))

tibble(
  data = pstretch(df, function(...) as_tibble(list(...)), .init = 10)
)



