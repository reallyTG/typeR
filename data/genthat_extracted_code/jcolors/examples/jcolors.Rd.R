library(jcolors)


### Name: jcolors
### Title: Vectors of colors for figures
### Aliases: jcolors

### ** Examples

par(mar=c(0.6,5.1,0.6,0.6))
plot(0, 0, type = "n", xlab = "", ylab = "", xlim = c(0, 6), ylim = c(4, 0), yaxs = "i",
     xaxt = "n", yaxt = "n", xaxs = "i")
axis(side=3, at=1:3, c("default", "pal2", "pal3"), las=1)

def <- jcolors("default")
points(seq(along = def), rep(1, length(def)), pch = 22, bg = def, cex = 8)
pal2 <- jcolors("pal2")
points(seq(along = pal2), rep(2, length(pal2)), pch = 22, bg = pal2, cex = 8)
pal3 <- jcolors("pal3")
points(seq(along = pal3), rep(3, length(pal3)), pch = 22, bg = pal3, cex = 8)



