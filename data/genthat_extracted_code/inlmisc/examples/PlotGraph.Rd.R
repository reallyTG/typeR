library(inlmisc)


### Name: PlotGraph
### Title: Plot Graph
### Aliases: PlotGraph
### Keywords: hplot

### ** Examples

n <- 50L
x <- as.Date("2008-07-12") + 1:n
y <- sample.int(n, replace = TRUE)
PlotGraph(x, y, ylab = paste("Random number in", c("meters", "feet")),
          main = "Main Title", type = "p", pch = 16, scientific = FALSE,
          conversion.factor = 3.28)

y <- data.frame(lapply(1:3, function(i) sample(n, replace = TRUE)))
PlotGraph(x, y, ylab = "Random number", pch = 1, seq.date.by = "days",
          scientific = TRUE)

y <- sapply(1:3, function(i) sample((1:100) + i * 100, n, replace = TRUE))
m <- cbind(as.numeric(x), y)
col <- GetColors(3, scheme = "bright")
PlotGraph(m, xlab = "Number", ylab = "Random number", type = "b", pch = 15:17,
          col = col, pt.cex = 0.9)
legend("topright", LETTERS[1:3], inset = 0.05, col = col, lty = 1, pch = 15:17,
       pt.cex = 0.9, cex = 0.8, bg = "white")

d <- data.frame(x = as.Date("2008-07-12") + 1:8 * 1000,
                y0 = c(NA, NA, 1, 3, 1, 4, 2, pi),
                y1 = c(1, 2, NA, NA, 4, 3, 2, pi))
PlotGraph(d, type = "i", ylim = c(0, 5))




