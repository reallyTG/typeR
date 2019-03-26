library(seqinr)


### Name: col2alpha
### Title: To use a standard color with an alpha transparency chanel
### Aliases: col2alpha

### ** Examples

#
# Need alpha transparency channel 
#
par(mar = c(0, 0, 2, 2)+0.1, oma = c(0, 0, 2, 0), mfrow = c(3,2))
for(testcol in c("blue", "red", "green", "yellow", "purple", "darkgreen")){
  plot(0,0, type="n", xlim=0:1, ylim = 0:1, axes = FALSE, xlab = "", ylab = "", main = testcol)
  n <- 11
  for(i in seq(0, 1, length = n)){
    col <- col2alpha(testcol, i)
    rect(i, 0, i + 1/n, 1, col = col, border = "black", xpd = NA)
    text(i+0.5/n, 0.5, round(i,2), xpd = NA)
  }
}
mtext("Effect of alpha on some colors\nNote: need alpha transparency channel",
 side = 3, outer = TRUE)
#
# The substractive color scheme:
#
par(mar = c(0,0,3,0))
plot.new()
plot.window(xlim = c(-1.5, 1.5), ylim = c(-1,1.75), asp = 1)
n <- 10
alpha <- 1/n
for(i in 1:(2*n)){
  circle(x = -0.5, y = 0, col = col2alpha("yellow", alpha))
  circle(x = 0.5, y = 0, col = col2alpha("cyan", alpha))
  circle(x = 0, y = 3/4, col = col2alpha("magenta", alpha))
}
title("Substractive color scheme\nNote: need alpha transparency channel")



