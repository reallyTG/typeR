library(hyperSpec)


### Name: trellis.factor.key
### Title: Color coding legend for factors Modifies a list of lattice
###   arguments (as for 'levelplot', etc.) according to the factor levels.
###   The colorkey will shows all levels (including unused), and the
###   drawing colors will be set accordingly.
### Aliases: trellis.factor.key
### Keywords: aplot

### ** Examples


chondro$z <- factor (rep (c("a", "a", "d", "c"),
                          length.out = nrow (chondro)),
                     levels = letters [1 : 4])

str (trellis.factor.key (chondro$z))

plotmap (chondro, z ~ x * y)

## switch off using trellis.factor.key:
## note that the factor levels are collapsed to c(1, 2, 3) rather than
## c (1, 3, 4)
plotmap (chondro, z ~ x * y, transform.factor = FALSE)

plotmap (chondro, z ~ x * y,
         col.regions = c ("gray", "red", "blue", "dark green"))




