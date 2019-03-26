library(swfscMisc)


### Name: braces
### Title: Braces
### Aliases: braces

### ** Examples

plot(x = c(0, 1), y = c(0, 1000), type = "n", xlab= "", ylab = "")
braces(xfrom = 0.2, xto = 0.8, yfrom = c(400, 600), yto = c(300, 700))
plot(x = c(0, 100), y = c(0, 17), type = "n", xlab = "x", ylab = "y")
text(10, 16, "radius =")
for (i in 1:8) {
  braces(xfrom = 10 * i + 10, xto = 10 * i + 18, yfrom = 1, 
         yto = 15, radius = i / 4, lwd = 2)
  text(10 * i + 12, 16, round(i / 4, 2))
}
plot(c(0, 100), c(0, 17), type = "n", xlab = "x", ylab = "y")
braces(30, 80, 13, 11, 1)

plot(c(0, 100), c(0, 17), type = "n", xlab = "x", ylab = "y")
braces(c(20, 80, 30), c(10,75,40), 1, 15, radius = c(0.2, 0.5, 0.1), 
       lwd = c(1, 2, 3), col = 1:2, lty = 1)

plot(c(0, 100), c(0, 17), type = "n")
braces(20, 80, 7, 5, 1)
braces(20, 80, 13, 15, 1)




