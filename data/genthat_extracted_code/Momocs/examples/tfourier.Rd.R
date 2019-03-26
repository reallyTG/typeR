library(Momocs)


### Name: tfourier
### Title: Tangent angle Fourier transform
### Aliases: tfourier tfourier.default tfourier.Out

### ** Examples

coo <- bot[1]
coo_plot(coo)
tf  <- tfourier(coo, 12)
tf
tfi <- tfourier_i(tf)
coo_draw(tfi, border='red', col=NA) # the outline is not closed...
coo_draw(tfourier_i(tf, force2close=TRUE), border='blue', col=NA) # we force it to close.



