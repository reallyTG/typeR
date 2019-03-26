library(CVD)


### Name: greyscale.avg
### Title: Greyscale algorithms
### Aliases: greyscale.avg greyscale.Y greyscale.Linear greyscale.RMY
###   greyscale.BT709 greyscale.Luminosity
### Keywords: programming

### ** Examples

## Not run: 
##D samplePics <- c('fruits', 'pastel_color', 'sample1', 'TurnColorsGrayImage1', 'TurnColorsGrayImage2')
##D for (pics in samplePics)
##D {
##D fname<-paste(system.file(package='CVD'),'/extdata/',pics,'.png',sep='')
##D imgTest<-loadPNG(fname)
##D g1<-greyscale.avg(imgTest)
##D png::writePNG(g1, paste(pics, '.greyscale.avg.png',sep=''))
##D }
##D 
##D imgTest<-loadPNG(fname)
##D g1<-greyscale.avg(imgTest)
##D png::writePNG(g1, paste(pics, '.greyscale.avg.png',sep=''))
##D g1<-greyscale.BT709(imgTest)
##D png::writePNG(g1, paste(pics, '.BT709.png',sep=''))
##D g1<-greyscale.Linear(imgTest)
##D png::writePNG(g1, paste(pics, '.Linear.png',sep=''))
##D g1<-greyscale.Luminosity(imgTest)
##D png::writePNG(g1, paste(pics, '.Luminosity.png',sep=''))
##D g1<-greyscale.RMY(imgTest)
##D png::writePNG(g1, paste(pics, '.RMY.png',sep=''))
##D g1<-greyscale.Y(imgTest)
##D png::writePNG(g1, paste(pics, '.Y.png',sep=''))
##D 
## End(Not run)



