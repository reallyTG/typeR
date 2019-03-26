library(Rgnuplot)


### Name: Gpsetwd
### Title: Set gnuplot working directory
### Aliases: Gpsetwd
### Keywords: programming

### ** Examples

#Initialize the gnuplot handle
h1<-Gpinit()
## Not run: 
##D #change gnuplot's working directory to be the same as R's working directory (default)
##D Gpsetwd(h1)
##D #check it out
##D Gpgetwd(h1)
## End(Not run)
#close gnuplot handle
h1<-Gpclose(h1)



