library(Momocs)


### Name: efourier_shape
### Title: Calculates and draw 'efourier' shapes.
### Aliases: efourier_shape

### ** Examples

ef <- efourier(bot[1], 24)
efourier_shape(ef$an, ef$bn, ef$cn, ef$dn) # equivalent to efourier_i(ef)
efourier_shape() # is autonomous

panel(Out(a2l(replicate(100,
efourier_shape(nb.h=6, alpha=2.5, plot=FALSE))))) # Bubble family



