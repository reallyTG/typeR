library(ggtern)


### Name: geom_Xline
### Title: Fixed Value Lines
### Aliases: geom_Xline geom_Tline geom_Lline geom_Rline Tline tline Lline
###   lline Rline rline GeomTline GeomLline GeomRline
### Keywords: datasets

### ** Examples

ggtern() + 
geom_Tline(Tintercept=.5,arrow=arrow(), colour='red') + 
geom_Lline(Lintercept=.2, colour='green') + 
geom_Rline(Rintercept=.1, colour='blue')



