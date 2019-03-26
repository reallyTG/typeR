library(condvis)


### Name: dist1
### Title: Minkowski distance
### Aliases: dist1

### ** Examples

x <- runif(5000)
y <- runif(5000)

x1 <- 0.5
y1 <- 0.5

dev.new(width = 4, height = 5.3)
par(mfrow = c(2, 2))

for(p in c(0.5, 1, 2, 10)){
  d <- dist1(x = c(x1, y1), X = cbind(x, y), p = p) ^ (1/p)
  col <- rep("black", length(x))
  col[d < 0.3] <- "red"
  plot(x, y, pch = 16, col = col, asp = 1, main = paste("p = ", p, sep = ""))
}




