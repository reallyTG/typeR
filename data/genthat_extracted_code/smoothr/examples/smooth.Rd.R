library(smoothr)


### Name: smooth
### Title: Smooth a spatial feature
### Aliases: smooth

### ** Examples

library(sf)
# compare different smoothing methods
# polygons
par(mar = c(0, 0, 0, 0), oma = c(4, 0, 0, 0), mfrow = c(3, 3))
p_smooth_chaikin <- smooth(jagged_polygons, method = "chaikin")
p_smooth_ksmooth <- smooth(jagged_polygons, method = "ksmooth")
p_smooth_spline <- smooth(jagged_polygons, method = "spline")
for (i in 1:nrow(jagged_polygons)) {
  plot(st_geometry(p_smooth_spline[i, ]), col = NA, border = NA)
  plot(st_geometry(jagged_polygons[i, ]), col = "grey40", border = NA, add = TRUE)
  plot(st_geometry(p_smooth_chaikin[i, ]), col = NA, border = "#E41A1C", lwd = 2, add = TRUE)
  plot(st_geometry(p_smooth_ksmooth[i, ]), col = NA, border = "#4DAF4A", lwd = 2, add = TRUE)
  plot(st_geometry(p_smooth_spline[i, ]), col = NA, border = "#377EB8", lwd = 2, add = TRUE)
}
par(fig = c(0, 1, 0, 1), oma = c(0, 0, 0, 0), new = TRUE)
plot(0, 0, type = "n", bty = "n", xaxt = "n", yaxt = "n", axes = FALSE)
legend("bottom", legend = c("chaikin", "ksmooth", "spline"),
       col = c("#E41A1C", "#4DAF4A", "#377EB8"),
       lwd = 2, cex = 2, box.lwd = 0, inset = 0, horiz = TRUE)

# lines
par(mar = c(0, 0, 0, 0), oma = c(4, 0, 0, 0), mfrow = c(3, 3))
l_smooth_chaikin <- smooth(jagged_lines, method = "chaikin")
l_smooth_ksmooth <- smooth(jagged_lines, method = "ksmooth")
l_smooth_spline <- smooth(jagged_lines, method = "spline")
for (i in 1:nrow(jagged_lines)) {
  plot(st_geometry(l_smooth_spline[i, ]), col = NA)
  plot(st_geometry(jagged_lines[i, ]), col = "grey20", lwd = 3, add = TRUE)
  plot(st_geometry(l_smooth_chaikin[i, ]), col = "#E41A1C", lwd = 2, lty = 2, add = TRUE)
  plot(st_geometry(l_smooth_ksmooth[i, ]), col = "#4DAF4A", lwd = 2, lty = 2, add = TRUE)
  plot(st_geometry(l_smooth_spline[i, ]), col = "#377EB8", lwd = 2, lty = 2, add = TRUE)
}
par(fig = c(0, 1, 0, 1), oma = c(0, 0, 0, 0), new = TRUE)
plot(0, 0, type = "n", bty = "n", xaxt = "n", yaxt = "n", axes = FALSE)
legend("bottom", legend = c("chaikin", "smooth", "spline"),
       col = c("#E41A1C", "#4DAF4A", "#377EB8"),
       lwd = 2, cex = 2, box.lwd = 0, inset = 0, horiz = TRUE)



