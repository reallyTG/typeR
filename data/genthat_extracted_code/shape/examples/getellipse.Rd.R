library(shape)


### Name: getellipse
### Title: x-y coordinates of ellipse
### Aliases: getellipse
### Keywords: dplot

### ** Examples

plot(getellipse(1, from = 0, to = pi/2), type = "l", col = "red",
     lwd = 2, main = "getellipse")
lines(getellipse(0.5, 0.25, mid = c(0.5, 0.5)), type = "l", 
      col = "blue", lwd = 2)
lines(getellipse(0.5, 0.25, mid = c(0.5, 0.5), angle = 45), 
      type = "l", col = "green", lwd = 2)

lines(getellipse(0.2, 0.2, mid = c(0.5, 0.5), from = 0, to = pi/2), 
      type = "l", col = "orange", lwd = 2)
lines(getellipse(0.2, 0.2, mid = c(0.5, 0.5), from = pi/2, to = 0), 
      type = "l", col = "black", lwd = 2)
lines(getellipse(0.1, 0.1, mid = c(0.75, 0.5), from = -pi/2, to = pi/2), 
      type = "l", col = "black", lwd = 2)

emptyplot(main = "getellipse")
col <- femmecol(90)
for (i in seq(0, 180, by = 2)) 
      lines(getellipse(0.5, 0.25, mid = c(0.5, 0.5), angle = i),
            type = "l", col = col[(i/2)+1], lwd = 2)



