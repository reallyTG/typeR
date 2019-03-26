library(pals)


### Name: pal.bands
### Title: Show palettes and colormaps as colored bands
### Aliases: pal.bands

### ** Examples

pal.bands(c('red','white','blue'), rainbow)

op=par(mar=c(0,5,3,1))
pal.bands(cubehelix, gnuplot, jet, tol.rainbow, inferno,
  magma, plasma, viridis, parula, n=200, gap=.05)
par(op)

# Examples of sorting
labs=c('alphabet','alphabet2', 'glasbey','kelly','polychrome', 'watlington')
op=par(mar=c(0,5,3,1))
pal.bands(alphabet(), alphabet2(), glasbey(), kelly(),
  polychrome(), watlington(), sort="hue",
  labels=labs, main="sorted by hue")
par(op)
pal.bands(alphabet(), alphabet2(), glasbey(), kelly(),
  polychrome(), watlington(), sort="luminance",
  labels=labs, main="sorted by luminance")




