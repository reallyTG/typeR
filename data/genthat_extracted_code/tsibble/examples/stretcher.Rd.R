library(tsibble)


### Name: stretcher
### Title: Split the input to a list according to the stretching window
###   size.
### Aliases: stretcher pstretcher

### ** Examples

x <- 1:5
y <- 6:10
z <- 11:15
lst <- list(x = x, y = y, z = z)
df <- as.data.frame(lst)

stretcher(x, .size = 2)
stretcher(lst, .size = 2)
stretcher(df, .size = 2)
pstretcher(df, df, .size = 2)



