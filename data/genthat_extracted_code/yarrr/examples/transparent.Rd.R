library(yarrr)


### Name: transparent
### Title: transparent function
### Aliases: transparent
### Keywords: colors

### ** Examples


# Diagram of some examples
plot(1, ylim = c(0, 1), xlim = c(0, 12), bty = "n",
xaxt = "n", yaxt = "n", ylab = "", xlab = "", type = "na")


text(6, .9, "transparent('red', trans.val = x)")
points(x = 1:11, y = rep(.8, 11), pch = 16,
col = transparent("red", seq(0, 1, .1)), cex = 2)
text(x = 1:11, y = rep(.85, 11), seq(0, 1, .1))

text(6, .7, "transparent('red', trans.val = x)")
points(x = 1:11, y = rep(.6, 11), pch = 16,
col = transparent("blue", seq(0, 1, .1)), cex = 2)
text(x = 1:11, y = rep(.65, 11), seq(0, 1, .1))

text(6, .5, "transparent('forestgreen', trans.val = x)")
points(x = 1:11, y = rep(.4, 11), pch = 16,
col = transparent("forestgreen", seq(0, 1, .1)), cex = 2)
text(x = 1:11, y = rep(.45, 11), seq(0, 1, .1))

text(6, .3, "transparent('orchid1', trans.val = x)")
points(x = 1:11, y = rep(.2, 11), pch = 16,
col = transparent("orchid1", seq(0, 1, .1)), cex = 2)
text(x = 1:11, y = rep(.25, 11), seq(0, 1, .1))


# Scatterplot with transparent colors

a.x <- rnorm(100, mean = 0, sd = 1)
a.y <- a.x + rnorm(100, mean = 0, sd = 1)

par(mfrow = c(3, 3))

for(trans.val.i in seq(0, .1, length.out = 9)) {

 plot(a.x, a.y, pch = 16, col = transparent("blue", trans.val.i), cex = 1.5,
      xlim = c(-5, 5), ylim = c(-5, 5), xlab = "x", ylab = "y",
      main = paste("trans.val = ", round(trans.val.i, 2), sep = ""))

}



