library(spectacles)


### Name: cut
### Title: Manipulating the wavelength range of a 'Spectra' object
### Aliases: cut cut,Spectra-method

### ** Examples


# Loading example data
data(australia)
spectra(australia) <- sr_no ~ ... ~ 350:2500

# Extracting a specific wavelengths range
s <- cut(australia, wl = 450:550)
plot(s)

s <- cut(australia, wl = c(450:550, 1850:2050))
plot(s)

# Removing a specific wavelengths range
s <- cut(australia, wl = -1*450:550)
plot(s)

s <- cut(australia, wl = -1*c(450:550, 1850:2050))
plot(s)




