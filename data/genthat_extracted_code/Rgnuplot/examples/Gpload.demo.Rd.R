library(Rgnuplot)


### Name: GploadDemo
### Title: Load .dem gnuplot files
### Aliases: GploadDemo
### Keywords: programming

### ** Examples

#example of using GploadDemo and GpreadURL2string
#Initialize the gnuplot handle
h1<-Gpinit()
#change gnuplot's working directory to be the same as 
# R's working directory (default)
Gpsetwd(h1)
#load the file 'simple.dem'
#Gpcmd(h1, 'set terminal postscript eps color;set output "simple.eps"\n' 
# %s% GpURL2string('http://gnuplot.sourceforge.net/demo_svg/simple.1.gnu') %s%
#'\nset terminal X11;set output')
## Not run: 
##D if (!file.exists('/usr/share/doc/gnuplot-doc/examples/simple.dem')) 
##D stop('Please install gnuplot-doc')
##D GploadDemo(h1, '/usr/share/doc/gnuplot-doc/examples/simple.dem')
##D #pause R and gnuplot
##D Gppause()
##D # example of GpreadURL2string
##D #Kuen's Surface
##D gpcode<-GpURL2string('http://gnuplot.sourceforge.net/demo/transparent_solids.2.gnu')
##D #send gnuplot script
##D Gpcmd(h1, gpcode)
##D #Gpcmd(h1, 'set terminal postscript eps color
##D #set output "KuensSurface.eps"\n' ##D 
##D #pause R and gnuplot
##D Gppause()
## End(Not run)
#close gnuplot handle
h1<-Gpclose(h1)



