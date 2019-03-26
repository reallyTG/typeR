library(pxR)


### Name: as.array.px
### Title: Extraction of data from px objects into arrays
### Aliases: as.array.px
### Keywords: manip

### ** Examples

my.px     <- read.px( system.file( "extdata", "example.px", package = "pxR"))
my.array  <- as.array( my.px )
my.array2  <- as.array( my.px ,use.codes=TRUE)
my.array3  <- as.array( my.px ,use.codes=c('municipios'))



