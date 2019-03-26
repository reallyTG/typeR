library(StratigrapheR)


### Name: sinpoint
### Title: Gives a table of equally sampled points following a sinusoidal
###   function
### Aliases: sinpoint

### ** Examples

res <- sinpoint(c(4,5), 5, 1, x0 = c(0,1), pos = 3)

plot(res$x, res$y)

multilines(res$i, res$x, res$y, col = c("black" ,"red"), type = "o")




