library(Rgnuplot)


### Name: Gpsetloadpath
### Title: Set gnuplot's additional directories, for data and scripts
### Aliases: Gpsetloadpath
### Keywords: programming

### ** Examples

#Initialize the gnuplot handle
h1<-Gpinit()
## Not run: 
##D #set gnuplot's additional search directories, to the extdata directory from Rgnuplot (default)
##D Gpsetloadpath(h1)
##D #get gnuplot's additional search directories
##D Gpgetloadpath(h1)
## End(Not run)
#close gnuplot handle
h1<-Gpclose(h1)



