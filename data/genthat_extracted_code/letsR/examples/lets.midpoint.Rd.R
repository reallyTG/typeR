library(letsR)


### Name: lets.midpoint
### Title: Compute the midpoint of species' geographic ranges
### Aliases: lets.midpoint

### ** Examples

## Not run: 
##D data(PAM)
##D mid <- lets.midpoint(PAM, method = "PC")
##D mid2 <- lets.midpoint(PAM, method = "GM")
##D mid3 <- lets.midpoint(PAM, method = "CMD")
##D mid4 <- lets.midpoint(PAM, method = "MCC")
##D mid5 <- lets.midpoint(PAM, method = "PC", planar = TRUE)
##D mid6 <- lets.midpoint(PAM, method = "GM", planar = TRUE)
##D mid7 <- lets.midpoint(PAM, method = "CMD", planar = TRUE)
##D mid8 <- lets.midpoint(PAM, method = "MCC", planar = TRUE)
##D 
##D for (sp in 1:nrow(mid)) {
##D  #sp = 4 # Or choose a line or species
##D  plot(PAM, name = mid[sp, 1])
##D  points(mid[sp, -1], col = adjustcolor("blue", .8), pch = 20, cex = 1.5)
##D  points(mid2[sp, -1], col = adjustcolor("green", .8), pch = 20, cex = 1.5)
##D  points(mid3[sp, -1], col = adjustcolor("yellow", .8), pch = 20, cex = 1.5)
##D  points(mid4[sp, -1], col = adjustcolor("purple", .8), pch = 20, cex = 1.5)
##D  points(mid5[sp, -1], col = adjustcolor("orange", .8), pch = 20, cex = 1.5)
##D  points(mid6[sp, -1], col = adjustcolor("black", .8), pch = 20, cex = 1.5)
##D  points(mid7[sp, -1], col = adjustcolor("gray", .8), pch = 20, cex = 1.5)
##D  points(mid8[sp, -1], col = adjustcolor("brown", .8), pch = 20, cex = 1.5)
##D  Sys.sleep(1)
##D }
## End(Not run) 




