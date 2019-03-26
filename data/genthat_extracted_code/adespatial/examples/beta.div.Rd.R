library(adespatial)


### Name: beta.div
### Title: Beta diversity computed as Var(Y)
### Aliases: beta.div

### ** Examples


if(require("vegan", quietly = TRUE) & require("adegraphics", quietly = TRUE)){
data(mite)
res = beta.div(mite, "hellinger", nperm=999)

# Plot a map of the LCBD indices using the Cartesian coordinates
data(mite.xy)
s.value(mite.xy, res$LCBD, symbol = "circle", col = c("white", "brown"), main="Map of mite LCBD")

### Example using the mite abundance data and the percentage difference dissimilarity
res = beta.div(mite, "percentdiff", nperm=999, clock=TRUE)

# Plot a map of the LCBD indices
signif = which(res$p.LCBD <= 0.05)	# Which are the significant LCBD indices?
nonsignif = which(res$p.LCBD > 0.05)	# Which are the non-significant LCBD indices?
g1 <- s.value(mite.xy[signif,], res$LCBD[signif], ppoint.alpha = 0.5, plegend.drawKey = FALSE,
 symbol = "circle", col = c("white", "red"), main="Map of mite LCBD (red = significant indices)")
g2 <- s.value(mite.xy[nonsignif,], res$LCBD[nonsignif], ppoint.alpha = 0.5,
symbol = "circle", col = c("white", "blue"))
g2+g1
}




