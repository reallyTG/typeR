library(Rgnuplot)


### Name: Gpmandel
### Title: Recursive implementation of the Mandelbrot set function
### Aliases: Gpmandel
### Keywords: programming

### ** Examples

#Initialize the gnuplot handle
h1<-Gpinit()
#set gnuplot's additional search directories, to the extdata directory from Rgnuplot (default)
Gpsetloadpath(h1)
#change gnuplot's working directory to be the same as R's working directory (default)
Gpsetwd(h1)
## Not run: 
##D #create the fractal data from R calling a C function, with more points and more iterations
##D mandelxy2<-function(x,y) Gpmandel(x,y,c(0,0),0,1000)
##D GpR2splot(mandelxy2,'mandel4.dat',c(-1.5,0.5),c(-1,1),c(500,500),c(300,300),TRUE)
##D Gpcmd(h1,'reset
##D splot "mandel4.dat" w  pm3d notitle')
##D #pause R and gnuplot
##D Gppause()
## End(Not run)
#close gnuplot handles
h1<-Gpclose(h1)



