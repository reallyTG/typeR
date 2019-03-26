library(Momocs)


### Name: tfourier_shape
### Title: Calculates and draws 'tfourier' shapes.
### Aliases: tfourier_shape

### ** Examples

tf <- tfourier(bot[1], 24)
tfourier_shape(tf$an, tf$bn) # equivalent to rfourier_i(rf)
tfourier_shape()
tfourier_shape(nb.h=6, alpha=0.4, nb.pts=500)
panel(Out(a2l(replicate(100,
coo_force2close(tfourier_shape(nb.h=6, alpha=2, nb.pts=200, plot=FALSE)))))) # biological shapes



