library(CENFA)


### Name: cnfa
### Title: Climate-niche factor analysis
### Aliases: cnfa print.cnfa show.cnfa cnfa,GLcenfa,Raster-method
###   cnfa,GLcenfa,Spatial-method cnfa,Raster,Raster-method
###   cnfa,Raster,Spatial-method

### ** Examples

mod1 <- cnfa(x = climdat.hist, s.dat = ABPR, field = "CODE")

# using GLcenfa as an initial step
# for multi-species comparison

glc <- GLcenfa(x = climdat.hist)
mod2 <- cnfa(x = glc, s.dat = ABPR, field = "CODE")

# same results either way
all.equal(m.factor(mod1), m.factor(mod2))
all.equal(s.factor(mod1), s.factor(mod2))




