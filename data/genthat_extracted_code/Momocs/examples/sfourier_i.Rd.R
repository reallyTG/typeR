library(Momocs)


### Name: sfourier_i
### Title: Inverse radii variation Fourier transform
### Aliases: sfourier_i

### ** Examples

coo <- coo_center(bot[1]) # centering is almost mandatory for sfourier family
coo_plot(coo)
rf  <- sfourier(coo, 12)
rf
rfi <- sfourier_i(rf)
coo_draw(rfi, border='red', col=NA)




