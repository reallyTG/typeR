library(Momocs)


### Name: rfourier
### Title: Radii variation Fourier transform (equally spaced radii)
### Aliases: rfourier rfourier.default rfourier.Out

### ** Examples

data(bot)
coo <- coo_center(bot[1]) # centering is almost mandatory for rfourier family
coo_plot(coo)
rf  <- rfourier(coo, 12)
rf
rfi <- rfourier_i(rf)
coo_draw(rfi, border='red', col=NA)

# Out method
bot %>% rfourier()



