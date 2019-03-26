library(LICORS)


### Name: contCA00
### Title: Simulated 7 state (1+1)D field
### Aliases: contCA00
### Keywords: dataset datasets

### ** Examples

# set original par parameters
op <- par(no.readonly = TRUE)

data(contCA00)
par(mfrow = c(2, 2), mar = c(3, 3, 2, 1))
for (ii in 1:3) {
    image2(contCA00[[ii]], legend = FALSE, col = "RdBu", main = attr(summary(contCA00), 
        "dimnames")[[1]][ii])
    mtext("Time", 1, 1)
    mtext("Space", 2, 1)
}
par(op)
## Not run: 
##D LC_geom <- setup_LC_geometry(speed = 1, horizon = list(PLC = 2, FLC = 0), 
##D     shape = "cone")
##D bb <- data2LCs(contCA00$observed, LC.coordinates = LC_geom$coordinates)
##D image2(bb$PLC)
##D image2(cor(bb$PLC), zlim = c(-1, 1), col = "RdBu")
##D mod_kk <- kmeanspp(bb$PLC, k = 10)
##D plot(bb$FLC, col = mod_kk$cluster, pch = ".", cex = 3)
##D 
##D ff <- estimate_LC_pdfs(bb$FLC, states = mod_kk$cluster, method = "nonparametric")
##D matplot(bb$FLC, ff, pch = ".", cex = 2)
## End(Not run)



