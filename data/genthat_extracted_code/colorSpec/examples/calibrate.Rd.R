library(colorSpec)


### Name: calibrate
### Title: make a linear modification to a colorSpec responder
### Aliases: calibrate calibrate.colorSpec
### Keywords: colorSpec

### ** Examples

# make an art gallery illuminated by illuminant A, and with tristimulus XYZ as output
gallery = product( A.1nm, 'artwork', xyz1931.1nm, wave='auto')      
# chromatically adapt the output XYZs to D50 white point, using Bradford matrix
gallery.D50 = calibrate( gallery, response=officialXYZ('D50') )

# make an RGB flatbead scanner from illuminant F11 and a Flea2 camera
scanner = product( subset(Fs.5nm,'F11'), 'paper', Flea2.RGB, wave='auto')  
# adjust RGB gain factors (white balance) so the perfect reflecting diffuser yields RGB=(1,1,1)
scanner = calibrate( scanner )

# same flatbead scanner, but this time with some "white headroom"
scanner = product( subset(Fs.5nm,'F11'), 'paper', Flea2.RGB, wave='auto' )  
scanner = calibrate( scanner, response=0.95 )
scanner



