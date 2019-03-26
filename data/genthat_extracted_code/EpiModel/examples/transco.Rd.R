library(EpiModel)


### Name: transco
### Title: Obtain Transparent Colors
### Aliases: transco
### Keywords: colorUtils internal

### ** Examples

## Example 1: Bubble plot with multiple length color vector
n <- 25
x <- sort(sample(1:200, n))
y <- 10 + 2*x + rnorm(n, 0, 10)
z <- rpois(n, 10)
cols <- transco(c("steelblue", "black"), 0.5)
par(mar=c(2, 2, 1, 1))
plot(x, y, cex = z/4, pch = 21, col = "black",
     bg = cols[1], lwd = 1.2, axes = FALSE,
     ylim = c(0, 500), xlim = c(0, 250),
     yaxs = "r", xaxs = "r")
axis(2, seq(0, 500, 100), col = "white", las = 2,
    cex.axis = 0.9, mgp = c(2, 0.5, 0))
axis(1, seq(0, 250, 50), cex.axis = 0.9,
     mgp = c(2, 0.5, 0))
abline(h = seq(100, 500, 100), col = cols[2])

## Example 2: Network plot with multiple length alpha vector
net <- network.initialize(500, directed = FALSE)
vcol <- transco("firebrick",
                alpha = seq(0, 1, length = network.size(net)))
par(mar = c(0, 0, 0, 0))
plot(net, vertex.col = vcol, vertex.border = "grey70",
     vertex.cex = 1.5, edge.col = "grey50")




