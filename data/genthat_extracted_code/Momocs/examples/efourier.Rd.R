library(Momocs)


### Name: efourier
### Title: Elliptical Fourier transform (and its normalization)
### Aliases: efourier efourier.default efourier.Out efourier_norm

### ** Examples

# single shape
coo <- bot[1]
coo_plot(coo)
ef <- efourier(coo, 12)
ef
efi <- efourier_i(ef)
coo_draw(efi, border='red', col=NA)

# on Out
bot %>% slice(1:5) %>% efourier



