library(Rgnuplot)


### Name: Gpgetfontpath
### Title: Get gnuplot's additional directories, for fonts
### Aliases: Gpgetfontpath
### Keywords: programming

### ** Examples

#Initialize the gnuplot handle
h1<-Gpinit()
## Not run: 
##D #set gnuplot's additional search directories for fonts, to the extdata directory
##D #from Rgnuplot (default)
##D Gpsetfontpath(h1)
##D #get gnuplot's additional search directories for fonts
##D Gpgetfontpath(h1)
## End(Not run)
#close gnuplot handle
h1<-Gpclose(h1)



