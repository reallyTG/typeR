library(Momocs)


### Name: efourier_i
### Title: Inverse elliptical Fourier transform
### Aliases: efourier_i

### ** Examples

coo <- bot[1]
coo_plot(coo)
ef  <- efourier(coo, 12)
ef
efi <- efourier_i(ef)
coo_draw(efi, border='red', col=NA)



