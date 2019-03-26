library(Ropj)


### Name: read.opj
### Title: Parse Origin(R) project file into a list of objects
### Aliases: read.opj
### Keywords: IO file

### ** Examples

  x <- read.opj(system.file('test.opj', package = 'Ropj'))
  head(x$Book2, 7)
  attr(x$Book2, 'comments')
  attr(x$Book2, 'commands')
  with(x$Book1, head(Sheet2 - Sheet1))
  x$MBook1$MSheet1[1:4,1:4]
  x$Note1

  ## Not run: 
##D     # encoding names aren't guaranteed to be supported across all platforms
##D     x <- read.opj(system.file('test.opj', package = 'Ropj'), 'WINDOWS-1251')
##D     x$cyrillic
##D   
## End(Not run)



