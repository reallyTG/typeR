library(Momocs)


### Name: rfourier_i
### Title: Inverse radii variation Fourier transform
### Aliases: rfourier_i

### ** Examples

data(bot)
coo <- coo_center(bot[1]) # centering is almost mandatory for rfourier family
coo_plot(coo)
rf  <- rfourier(coo, 12)
rf
rfi <- rfourier_i(rf)
coo_draw(rfi, border='red', col=NA)




