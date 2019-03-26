library(VGAMdata)


### Name: wffc.points
### Title: Point System for the 2008 World Fly Fishing Championships
### Aliases: wffc.P1 wffc.P1star wffc.P2 wffc.P2star wffc.P3 wffc.P3star
###   wffc.P4 wffc.P4star
### Keywords: models

### ** Examples

## Not run: 
##D  fishlength <- seq(0.0, 0.72, by = 0.001)
##D plot(fishlength, wffc.P2star(fishlength), type = "l", col = "blue",
##D      las = 1, lty = "dashed", lwd = 2, las = 1, cex.main = 0.8,
##D      xlab = "Fish length (m)", ylab = "Competition points",
##D      main = "Current (red) and proposed (blue and green) WFFC point system")
##D lines(fishlength, wffc.P1star(fishlength), type = "l", col = "red", lwd = 2)
##D lines(fishlength, wffc.P3star(fishlength), type = "l", col = "darkgreen",
##D       lwd = 2, lty = "dashed")
##D lines(fishlength, wffc.P4star(fishlength), type = "l", col = "orange",
##D       lwd = 2, lty = "dashed")
##D abline(v = (1:4) * 0.18, lty = "dotted")
##D abline(h = (1:13) * wffc.P1star(0.18), lty = "dotted") 
## End(Not run)

# Successive slopes:
(wffc.P1star((2:8)*0.18) - wffc.P1star((1:7)*0.18)) / (0.18 * 2000)
(wffc.P3star((2:8)*0.18) - wffc.P3star((1:7)*0.18)) / (0.18 * 2000)
(wffc.P4star((2:8)*0.18) - wffc.P4star((1:7)*0.18)) / (0.18 * 2000)

# More successive slopes:
MM2 <- 0.18 / 2
ind1 <- 2:12
(wffc.P4star((ind1)*MM2) - wffc.P4star((ind1-1)*MM2)) / (MM2 * 2000)

# About 50 percent more points:
wffc.P2    (2 * 0.18) / wffc.P1    (2 * 0.18)
wffc.P2star(2 * 0.18) / wffc.P1star(2 * 0.18)



