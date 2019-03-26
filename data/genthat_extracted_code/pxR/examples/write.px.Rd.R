library(pxR)


### Name: write.px
### Title: Write a PC-Axis file
### Aliases: write.px
### Keywords: manip

### ** Examples

opx1 <- read.px(system.file( "extdata", "example.px", package = "pxR"))  
## Not run: 
##D 	write.px(opx1, file = "opx.px")
##D 	write.px(opx1, file = "opx.px", 
##D                    heading = c("sexo", "edad"),
##D                    stub = "municipios")
##D         write.px(opx1, filename  = "opx.px", 
##D                  keys = c("municipios","edad")  )
## End(Not run)



