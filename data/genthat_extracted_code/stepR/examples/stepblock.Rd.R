library(stepR)


### Name: stepblock
### Title: Step function
### Aliases: stepblock [.stepblock print.stepblock plot.stepblock
###   lines.stepblock
### Keywords: nonparametric

### ** Examples

# step function consisting of 3 blocks: 1 on (0, 3]; 2 on (3, 6], 0 on (6, 8]
# sampled on the integers 1:10
f <- stepblock(value = c(1, 2, 0), rightEnd = c(3, 6, 8))
f
# show different plot types
plot(f, type = "C")
lines(f, type = "E", lty = 2, col = "red")
lines(f, type = "B", lty = 3, col = "blue")
legend("bottomleft", legend = c("C", "E", "B"), lty = 1:3, col = c("black", "red", "blue"))



