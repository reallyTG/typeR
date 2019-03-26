library(CVD)


### Name: approx.scotopic.luminance.LarsonEtAl.RGB
### Title: Approximation of the scotopic luminance
### Aliases: approx.scotopic.luminance.LarsonEtAl.RGB
###   approx.scotopic.luminance.LarsonEtAl.RGB.array
###   approx.scotopic.luminance.LarsonEtAl.XYZ
###   approx.scotopic.luminance.LarsonEtAl.XYZ.array
### Keywords: programming

### ** Examples

## Not run: 
##D samplePics <- c('fruits', 'pastel_color', 'sample1', 'TurnColorsGrayImage1', 'TurnColorsGrayImage2')
##D for (pics in samplePics)
##D {
##D fname<-paste(system.file(package='CVD'),'/extdata/',pics,'.png',sep='')
##D imgTest<-loadPNG(fname)
##D imgTest.array<-approx.scotopic.luminance.LarsonEtAl.RGB.array(imgTest)
##D png::writePNG(imgTest.array, paste(pics, '.approx.scotopic.luminance.LarsonEtAl.RGB.png',sep=''))
##D }
## End(Not run)



