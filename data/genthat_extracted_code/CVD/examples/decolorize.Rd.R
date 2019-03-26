library(CVD)


### Name: decolorize
### Title: Decolorize algorithm from Mark Grundland and Neil A. Dodgson
### Aliases: decolorize decolorizeFile
### Keywords: programming

### ** Examples

## Not run: 
##D samplePics <- c('fruits', 'pastel_color', 'sample1', 'TurnColorsGrayImage1', 'TurnColorsGrayImage2')
##D for (pics in samplePics)
##D {
##D fname<-paste(system.file(package='CVD'),'/extdata/fruits.png',sep='')
##D g1<-decolorize(fname)
##D png::writePNG(g1$tones, paste(pics, '.decolorize.png',sep=''))
##D }
## End(Not run)



