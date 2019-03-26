library(CENFA)


### Name: enfa
### Title: Ecological-niche factor analysis
### Aliases: enfa print.enfa show.enfa enfa,GLcenfa,Raster-method
###   enfa,GLcenfa,Spatial-method enfa,Raster,Raster-method
###   enfa,Raster,Spatial-method

### ** Examples

mod1 <- enfa(x = climdat.hist, s.dat = ABPR, field = "CODE")

# using GLcenfa as an initial step
# for multi-species comparison

glc <- GLcenfa(x = climdat.hist)
mod2 <- enfa(x = glc, s.dat = ABPR, field = "CODE")
all.equal(m.factor(mod1), m.factor(mod2))




