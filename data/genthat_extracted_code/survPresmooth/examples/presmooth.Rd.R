library(survPresmooth)


### Name: presmooth
### Title: Compute Presmoothed Estimators
### Aliases: presmooth

### ** Examples

	## Not run: 
##D ## Analysis with the example dataset (pscheck)
##D 
##D ## Cumulative hazard function (chf) estimation
##D 
##D # Presmoothed estimate of chf with bootstrap bandwidth (fixing the randomization seed
##D # makes further comparisons easier)
##D 
##D set.seed(1)
##D 
##D Hboot1 <- presmooth(t, delta, pscheck, estimand = "H", bw.selec = "bootstrap")
##D 
##D # As above, but: 1) specifying the points where the estimate is computed (note the war-
##D # ning), 2) specifying the search grid for the bandwidth, and 3) saving the bootstrap
##D # MISE
##D 
##D set.seed(1)
##D 
##D Hboot2 <- presmooth(t, delta, pscheck, estimand = "H", bw.selec = "bootstrap", x.est = 
##D    seq(0, 1, by = 0.02), grid.bw = seq(0.55, 0.7, by = 0.01), control = 
##D    control.presmooth(save.mise = TRUE))
##D 
##D # A plot of the MISE, showing the bootstrap bandwidth
##D 
##D with(Hboot2,{
##D    plot(grid.bw$grid.bw, mise, xlab = "Bandwidth", ylab = "MISE", main = 
##D       expression(paste("Bootstrap bandwidth, ", b[boot])), type = "l")
##D    points(bandwidth, mise[grid.bw$grid.bw == bandwidth], pch = 46, cex = 5)
##D    segments(bandwidth, 0, bandwidth, mise[grid.bw$grid.bw == bandwidth], lty = "dotted")
##D    text(bandwidth, min(mise), bquote(paste("  ", b[boot] == .(bandwidth))), adj = c(0, 0))
##D })
##D 
##D # A plot of the presmoothed chf compared with Nelson-Aalen estimate and the true curve.
##D # The point (0, 0) must be added. 
##D 
##D plot(c(0, Hboot2$x.est), c(0, Hboot2$estimate), xlab = "t", ylab = "Cumulative hazard",
##D    type = "s")
##D 
##D Hna <- presmooth(t, delta, pscheck, estimand = "H", bw.selec = "fixed", fixed.bw = 0)
##D 
##D lines(c(0, Hna$x.est), c(0, Hna$estimate), type = "s", col = "red")
##D 
##D curve(x^3, add = TRUE, col = "grey", lty = "dotted")
##D 
##D legend("topleft", legend = c("Presmoothed Nelson-Aalen", "Nelson-Aalen", "True"), col =
##D    c("black", "red", "grey"), lty = c("solid", "solid", "dotted"))
##D 
##D # An alternative way of obtaining the Nelson-Aalen estimate
##D 
##D Hna <- presmooth(t, delta, pscheck, "H", presmoothing = FALSE)
##D 
##D ## Hazard function (hf) estimation 
##D 
##D # (An example where right-boundary correction is successful) Presmoothed estimate of hf
##D # 1) with plug-in bandwidth with and without right-boundary correction, 2) specifying the
##D # grid for presmoothing bandwidth selection and 3) specifying the support of the weight
##D # function
##D 
##D hpi1 <- presmooth(t, delta, pscheck, estimand = "h", bw.selec = "plug-in", x.est = 
##D    seq(0, max(pscheck$t), by = 0.02), grid.bw.pil = seq(range(pscheck$t)[1],
##D    range(pscheck)[2], by = 0.01), control = control.presmooth(q.weight = c(0.25, 0.75)))
##D 
##D hpi2 <- presmooth(t, delta, pscheck, estimand = "h", bw.selec = "plug-in", bound = "right",
##D    x.est = seq(0, max(pscheck$t), by = 0.02), grid.bw.pil = seq(range(pscheck$t)[1],
##D    range(pscheck$t)[2], by = 0.01), control = control.presmooth(q.weight = c(0.25, 0.75)))
##D 
##D plot(hpi1$x.est, hpi1$estimate, xlab = "t", ylab = "Hazard", ylim = c(0,
##D    max(pmax(hpi1$estimate, hpi2$estimate))), type = "l")
##D 
##D lines(hpi2$x.est, hpi2$estimate, col = 2)
##D 
##D legend("bottomright", legend = c("none", "right"), title = "Boundary effect correction",
##D    col = 1:2, lty = 1)
##D 
##D # Estimation of hf using a bootstrap bandwidth. The values chosen for the grid.bw argument
##D # are based on the result of preliminary trials (Warning: it may take a while ...)
##D 
##D set.seed(1)
##D 
##D hboot <- presmooth(t, delta, pscheck, estimand = "h", bw.selec = "bootstrap", bound = "right",
##D    x.est = seq(0, max(pscheck$t), by = 0.02), grid.bw.pil = seq(range(pscheck$t)[1],
##D    range(pscheck)[2], by = 0.01), grid.bw = list(seq(0.4, 0.8, by = 0.05), 
##D    seq(0.6, 0.9, by = 0.005)), control = control.presmooth(q.weight = c(0.25, 0.75),
##D    save.mise = TRUE))
##D 
##D # A plot of the bootstrap MISE, showing the bootstrap bandwidth
##D 
##D with(hboot,{
##D    contour(grid.bw$grid.bw.1, grid.bw$grid.bw.2, mise, levels = seq(min(mise), max(mise),
##D       length.out = 20), xlab = "Presmoothing bandwidth", ylab = "Smoothing bandwidth",
##D       main = "Bootstrap MISE")
##D    points(bandwidth[1], bandwidth[2], pch = 46, cex = 6)
##D    text(bandwidth[1], bandwidth[2], bquote(paste("  ", b[boot], symbol("="), symbol("("),
##D       .(bandwidth[1]), symbol(","), .(bandwidth[2]), symbol(")"))), adj = c(1, 0))
##D })
##D 
##D # Compare with the hf estimate obtained with plug-in bandwidth and the true curve
##D 
##D plot(hpi2$x.est, hpi2$estimate, xlab = "t", ylab = "Hazard", ylim = c(0, 
##D    max(pmax(hpi2$estimate, hboot$estimate))), type = "l")
##D 
##D lines(hboot$x.est, hboot$estimate, col = 2)
##D 
##D curve(3*x^2, add = TRUE, col = "grey", lty = "dotted")
##D 
##D legend("bottomright", legend = c("Plug-in bandwidth", "Bootstrap bandwidth", "True"),
##D    col = c("black", "red", "grey"), lty = c("solid", "solid", "dotted"))
##D 
##D ## Density function (df) estimation
##D 
##D # Presmoothed estimate of df with plug-in and bootstrap bandwidths (with default options)
##D # and comparison with the true df
##D 
##D dpi <- presmooth(t, delta, pscheck, estimand = "f", bw.selec = "plug-in")
##D 
##D # The bootstrap presmoothing bandwidth is on the right boundary of the default grid (which
##D # in fact is the upper bound for the bandwidth: the range of the observed times)
##D 
##D set.seed(1)
##D 
##D dboot <- presmooth(t, delta, pscheck, estimand = "f", bw.selec = "bootstrap")
##D 
##D # For this example, the estimates with either plugin or bootstrap bandwidth are very similar 
##D      
##D plot(dpi$x.est, dpi$estimate, xlab = "t", ylab = "Density", ylim = c(0, 
##D    max(pmax(dpi$estimate, dboot$estimate))), type = "l", col = "blue", lty = 2)
##D      
##D lines(dboot$x.est, dboot$estimate, col = "red", lty = 4)
##D      
##D curve(3*x^2*exp(-x^3), add = TRUE, lty = 1)
##D      
##D legend("bottomright", legend = c("Plug-in bandwidth", "Bootstrap bandwidth", "True"),
##D    col = c("blue", "red", "black"), lty = c(2, 4, 1))
##D 	
## End(Not run)



