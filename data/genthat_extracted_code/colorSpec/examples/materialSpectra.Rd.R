library(colorSpec)


### Name: materialSpectra
### Title: compute standard material spectra
### Aliases: materialSpectra neutralMaterial rectangularMaterial
###   lensAbsorbance
### Keywords: materials

### ** Examples

#   make a perfect reflecting diffuser (PRD)
prd = neutralMaterial( 1 )

#   make a perfect transmitting filter (PTF)
ptf = prd
quantity(ptf) = 'transmittance'

#   make a band-stop filter (for interval [500,550])
#   with 1% transmittance in the band, and 99% outside the band
bs = rectangularMaterial( c(500,550), -0.98, 400:700 )
bs = rectangularMaterial( c(550,500),  0.98, 400:700 )  # equivalent to previous line

#   compare transmittance at 3 ages: 20, 32, and 80 years
plot( linearize(lensAbsorbance( c(20,32,80) )), col='black', lty=1:3 )



