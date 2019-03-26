library(tsibble)


### Name: tiler
### Title: Splits the input to a list according to the tiling window size.
### Aliases: tiler ptiler

### ** Examples

x <- 1:5
y <- 6:10
z <- 11:15
lst <- list(x = x, y = y, z = z)
df <- as.data.frame(lst)

tiler(x, .size = 2)
tiler(lst, .size = 2)
ptiler(lst, .size = 2)
ptiler(list(x, y), list(y))
ptiler(df, .size = 2)
ptiler(df, df, .size = 2)



