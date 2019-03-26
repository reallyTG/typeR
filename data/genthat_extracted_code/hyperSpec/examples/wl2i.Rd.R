library(hyperSpec)


### Name: wl2i
### Title: Conversion between Wavelength and Spectra Matrix Column Index
###   'wl2i' returns the column indices for the spectra matrix for the
###   given wavelengths. 'i2wl' converts column indices into wavelengths.
### Aliases: wl2i i2wl

### ** Examples


flu
wl2i (flu, 405 : 407)
wl2i (flu, 405 ~ 407)
  
## beginning of the spectrum to 407 nm 
wl2i (flu, min ~ 407)

## 2 data points from the beginning of the spectrum to 407 nm 
wl2i (flu, min + 2i ~ 407)

## the first 3 data points   
wl2i (flu, min ~ min + 2i)

## from 490 nm to end of the spectrum 
wl2i (flu, 490 ~ max)
  
## the last 8 data points 
wl2i (flu, max - 7i ~ max)
  
## get 450 nm +- 3 data points
wl2i (flu, 450 - 3i ~ 450 + 3i) 
  
wl2i (flu, 300 : 400) ## all NA: 
wl2i (flu, 600 ~ 700) ## NULL: completely outside flu's wavelength range

  
i2wl (chondro, 17:20)




