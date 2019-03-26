library(StratigrapheR)


### Name: flip.lim
### Title: Inverts the intervals
### Aliases: flip.lim

### ** Examples

l   <- c(1,3,5,7,9,10)
r   <- c(3,4,7,8,9,11)
b   <- "]["

xlim <- c(-1,15)

res <- flip.lim(l = l, r = r, b = b, xlim = xlim)

plot(1,1,type = "n", xlim = c(-4, 20), ylim = c(0.3, 1.8))
rect(l, 1.1, r, 1.4, col = "green", border = "darkgreen", lwd = 3)
rect(res$l, 1, res$r, 0.7, col = "red", border = "darkred", lwd = 3)
abline(v = xlim)




