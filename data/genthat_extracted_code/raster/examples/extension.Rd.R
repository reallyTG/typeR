library(raster)


### Name: extension
### Title: Filename extensions
### Aliases: extension extension<-
### Keywords: file

### ** Examples

fn <- "c:/temp folder/filename.exten sion"
extension(fn)
extension(fn) <- ".txt"
extension(fn)
fn <- extension(fn, '.document')
extension(fn)
extension(fn, maxchar=4)



