library(swfscMisc)


### Name: crossing.point
### Title: Crossing Point
### Aliases: crossing.point

### ** Examples

x <- 1:100
line1 <- cbind(x, 3 + 3 * x)
line2 <- cbind(x, 10 - 3 * x)
plot(line1[, 1], line1[, 2], type = "l", col = "red")
lines(line2[, 1], line2[, 2], col = "blue")
cr.pt <- crossing.point(line1, line2)
print(cr.pt)




