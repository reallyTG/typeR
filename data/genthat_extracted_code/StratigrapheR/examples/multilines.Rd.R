library(StratigrapheR)


### Name: multilines
### Title: Draws several lines
### Aliases: multilines

### ** Examples

i <- c(rep("A1",6), rep("A2",6), rep("A3",6))
x <- c(1,2,3,3,2,1,4,5,6,6,5,4,7,8,9,9,8,7)
y <- c(1,2,3,4,5,6,1,2,3,4,5,6,1,2,3,4,5,6)

plot(c(0,10),c(0,7),type = "n")

multilines(i, x, y, j = c("A3", "A1", "A2"), lty =  c(1,2,3), lwd = 2,
           type = c("l", "o", "o"), pch = c(NA,21,24), cex = 2)




