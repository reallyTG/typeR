library(ade4)


### Name: corvus
### Title: Corvus morphology
### Aliases: corvus
### Keywords: datasets

### ** Examples

data(corvus)

if(adegraphicsLoaded()) {
  g1 <- s.label(corvus[, 1:2], plab.cex = 0, porigin.include = FALSE, pgrid.draw = FALSE, 
    paxes.draw = TRUE, paxes.asp = "full", xlab = names(corvus)[2], 
    ylab = names(corvus)[2], plot = FALSE)
  g2 <- s.class(corvus[, 1:2], corvus[, 4]:corvus[, 3], plot = FALSE)
  G <- superpose(g1, g2, plot = TRUE)

} else {
  plot(corvus[, 1:2])
  s.class(corvus[, 1:2], corvus[, 4]:corvus[, 3], add.p = TRUE)
}



