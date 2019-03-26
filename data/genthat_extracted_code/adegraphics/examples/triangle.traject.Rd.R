library(adegraphics)


### Name: triangle.traject
### Title: Ternary plot with trajectories
### Aliases: triangle.traject
### Keywords: hplot aplot

### ** Examples

exo1 <- matrix(c(51.88, 32.55, 15.57, 44.94, 34.59, 20.47, 25.95, 39.15, 34.9,
  37.87, 43.19, 18.94, 34.2, 43.32, 22.48, 16.13, 42.18, 41.69,
  7.76, 70.93, 21.31, 6.22, 65.96, 27.82, 6.44, 57.06, 36.5,
  37.24, 32.45, 30.31, 16.09, 31.22, 52.69, 6.54, 24.68, 68.78), ncol = 3, byr = TRUE)
exo1 <- as.data.frame(exo1)
names(exo1) <- c("agr", "ouv", "ter")
com <- as.factor(rep(c("Gig", "Lun", "Gan", "Mat"), c(3, 3, 3, 3)))
rec <- as.factor(rep(c("68", "75", "82"), 4))
row.names(exo1) <- paste(com, rec, sep = "")
tri1 <- triangle.traject(exo1, fac = com, showposition=FALSE, pgrid.draw = FALSE, 
  col = TRUE, axis.text = list(cex = 0))



