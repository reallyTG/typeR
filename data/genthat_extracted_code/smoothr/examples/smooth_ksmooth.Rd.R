library(smoothr)


### Name: smooth_ksmooth
### Title: Kernel smooth
### Aliases: smooth_ksmooth

### ** Examples

# smooth_ksmooth works on matrices of coordinates
# use the matrix of coordinates defining a polygon as an example
m <- jagged_polygons$geometry[[2]][[1]]
m_smooth <- smooth_ksmooth(m, wrap = TRUE)
class(m)
class(m_smooth)
plot(m, type = "l", col = "black", lwd = 3, axes = FALSE, xlab = NA,
     ylab = NA)
lines(m_smooth, lwd = 3, col = "red")

# lines can also be smoothed
l <- jagged_lines$geometry[[2]][]
l_smooth <- smooth_ksmooth(l, wrap = FALSE, max_distance = 0.05)
plot(l, type = "l", col = "black", lwd = 3, axes = FALSE, xlab = NA,
     ylab = NA)
lines(l_smooth, lwd = 3, col = "red")

# explore different levels of smoothness
p <- jagged_polygons$geometry[[2]][[1]]
ps1 <- smooth_ksmooth(p, wrap = TRUE, max_distance = 0.01, smoothness = 0.5)
ps2 <- smooth_ksmooth(p, wrap = TRUE, max_distance = 0.01, smoothness = 1)
ps3 <- smooth_ksmooth(p, wrap = TRUE, max_distance = 0.01, smoothness = 2)
# plot
par(mar = c(0, 0, 0, 0), oma = c(10, 0, 0, 0))
plot(p, type = "l", col = "black", lwd = 3, axes = FALSE, xlab = NA,
     ylab = NA)
lines(ps1, lwd = 3, col = "#E41A1C")
lines(ps2, lwd = 3, col = "#4DAF4A")
lines(ps3, lwd = 3, col = "#377EB8")
par(fig = c(0, 1, 0, 1), oma = c(0, 0, 0, 0), new = TRUE)
plot(0, 0, type = "n", bty = "n", xaxt = "n", yaxt = "n", axes = FALSE)
legend("bottom", legend = c("0.5", "1", "2"),
       col = c("#E41A1C", "#4DAF4A", "#377EB8"),
       lwd = 3, cex = 2, box.lwd = 0, inset = 0, horiz = TRUE)

library(sf)
p <- jagged_polygons$geometry[[2]]
p_smooth <- smooth(p, method = "ksmooth")
class(p)
class(p_smooth)
plot(p_smooth, border = "red")
plot(p, add = TRUE)



