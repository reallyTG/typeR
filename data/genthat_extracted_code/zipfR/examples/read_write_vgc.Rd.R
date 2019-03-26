library(zipfR)


### Name: read.vgc
### Title: Loading and Saving Vocabulary Growth Curves (zipfR)
### Aliases: read.vgc write.vgc
### Keywords: file

### ** Examples


## Not run: 
##D 
##D ## examples will not be run during package compilation
##D ## since they would require accessing and writing to
##D ## external files
##D 
##D ## load Italian ultra- prefix vgc
##D ## and write to external text file
##D data(ItaUltra.emp.vgc)
##D write.vgc(ItaUltra.emp.vgc,"ultra.vgc")
##D ## now ultra.vgc is a text file with columns N, V and V1
##D 
##D ## we ready it back in
##D New.vgc <- read.vgc("ultra.vgc")
##D 
##D ## same vgc as ItaUltra.emp.vgc, compare:
##D summary(New.vgc)
##D summary(ItaUltra.emp.vgc)
##D head(New.vgc)
##D head(ItaUltra.emp.vgc)
##D 
## End(Not run)




