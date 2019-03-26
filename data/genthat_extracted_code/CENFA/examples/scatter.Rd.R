library(CENFA)


### Name: scatter
### Title: Biplots of 'cnfa' and 'enfa' objects.
### Aliases: scatter scatter,cnfa,GLcenfa-method
###   scatter,enfa,GLcenfa-method

### ** Examples

mod <- cnfa(x = climdat.hist, s.dat = ABPR, field = "CODE")
glc <- GLcenfa(x = climdat.hist)
scatter(x = mod, y = glc)




