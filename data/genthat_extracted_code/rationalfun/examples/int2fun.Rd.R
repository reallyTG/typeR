library(rationalfun)


### Name: int2fun
### Title: Convert a call to a function
### Aliases: int2fun

### ** Examples

x <- rationalfun(c(-6, -1, -8, 15, -1, 8, -9, 2), 
    c(8, 12, 16, 4, 4))
int <- integral(x)
fun <- int2fun(int)
fun(c(0, 1))



