library(tactile)


### Name: tactile.theme
### Title: Tactile Theme
### Aliases: tactile.theme

### ** Examples

xyplot(speed ~ dist, data = cars, par.settings = tactile.theme())
opars <- trellis.par.get()
trellis.par.set(tactile.theme())
show.settings()
trellis.par.set(opars)



