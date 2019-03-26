library(CENFA)


### Name: slot-access
### Title: Accessing CENFA slots
### Aliases: slot-access m.factor s.factor marginality specialization
###   sensitivity cov raster cov.cnfa cov.enfa cov.GLcenfa
###   raster,enfa-method raster,cnfa-method raster,GLcenfa-method
###   raster,GLdeparture-method names,GLcenfa-method
###   names,GLdeparture-method names,cnfa-method names,enfa-method
###   names,departure-method

### ** Examples

mod1 <- cnfa(x = climdat.hist, s.dat = ABPR, field = "CODE")
m.factor(mod1)




