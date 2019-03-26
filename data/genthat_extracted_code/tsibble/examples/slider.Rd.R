library(tsibble)


### Name: slider
### Title: Splits the input to a list according to the rolling window size.
### Aliases: slider pslider

### ** Examples

x <- 1:5
y <- 6:10
z <- 11:15
lst <- list(x = x, y = y, z = z)
df <- as.data.frame(lst)

slider(x, .size = 2)
slider(lst, .size = 2)
pslider(list(x, y), list(y))
slider(df, .size = 2)
pslider(df, df, .size = 2)



