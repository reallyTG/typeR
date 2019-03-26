library(Momocs)


### Name: rfourier_shape
### Title: Calculates and draw 'rfourier' shapes.
### Aliases: rfourier_shape

### ** Examples

data(bot)
rf <- rfourier(bot[1], 24)
rfourier_shape(rf$an, rf$bn) # equivalent to rfourier_i(rf)
rfourier_shape() # not very interesting

rfourier_shape(nb.h=12) # better
rfourier_shape(nb.h=6, alpha=0.4, nb.pts=500)

# Butterflies of the vignette' cover
panel(Out(a2l(replicate(100,
rfourier_shape(nb.h=6, alpha=0.4, nb.pts=200, plot=FALSE)))))



