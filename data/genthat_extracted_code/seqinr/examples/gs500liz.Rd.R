library(seqinr)


### Name: gs500liz
### Title: GS500LIZ size standards
### Aliases: gs500liz

### ** Examples

data(gs500liz)
op <- par(no.readonly = TRUE)
par(lend = "butt", mar = c(5,0,4,0)+0.1)
x <- gs500liz$liz
n <- length(x)
y <- rep(1, n)
plot(x, y, type = "h", yaxt = "n", xlab = "Fragment size [bp]",
  main = "GS500LIZ size standard", lwd = 2)
x1 <- x[!gs500liz$mask1]
segments(x1, 0, x1, 1, col = "red", lwd = 2)
x2 <- x[!gs500liz$mask2]
segments(x2, 0, x2, 1, col = "blue", lwd = 2)
col <- rep("black", n)
col[!gs500liz$mask1] <- "red"
col[!gs500liz$mask2] <- "blue"
text(x,1.05,paste(x, "bp"), srt = 90, col = col)
legend("top", inset = 0.1, legend = c("regular", "imprecise (mask1)", "extreme (mask2)"),
  lwd = 2, col = c("black","red","blue"))
par(op)



