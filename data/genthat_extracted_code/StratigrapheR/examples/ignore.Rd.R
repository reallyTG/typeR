library(StratigrapheR)


### Name: ignore
### Title: Ignores useless objects
### Aliases: ignore

### ** Examples

i <- c(rep("A1",6), rep("A2",6), rep("A3",6))
x <- c(1,2,3,3,2,1,4,5,6,6,5,4,7,8,9,9,8,7)
y <- c(1,2,3,4,5,6,1,2,3,4,5,6,1,2,3,4,5,6)

xlim <- c(2,5)
ylim <- c(0,1.5)

plot(c(0,10),c(0,10),type = "n")
rect(xlim[1], ylim[1], xlim[2], ylim[2])

multilines(i, x, y, lty = 3, col = "grey80")

res <- ignore(i, x, y, arg = list(lty =  1, lwd = 3,
              col = c("orange", "green", "red")),
              xlim = xlim, ylim = ylim)

do.call(multilines, res)




