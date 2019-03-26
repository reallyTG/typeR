library(Momocs)


### Name: sfourier_shape
### Title: Calculates and draw 'sfourier' shapes.
### Aliases: sfourier_shape

### ** Examples

rf <- sfourier(bot[1], 24)
sfourier_shape(rf$an, rf$bn) # equivalent to sfourier_i(rf)
sfourier_shape() # not very interesting

sfourier_shape(nb.h=12) # better
sfourier_shape(nb.h=6, alpha=0.4, nb.pts=500)

# Butterflies of the vignette' cover
panel(Out(a2l(replicate(100,
sfourier_shape(nb.h=6, alpha=0.4, nb.pts=200, plot=FALSE)))))



