library(Rgnuplot)


### Name: Gpsetstyle
### Title: Set the plotting style
### Aliases: Gpsetstyle
### Keywords: programming

### ** Examples

#"Hello World!" - text on legend
#Initialize the gnuplot handle
h1<-Gpinit()
## Not run: 
##D #set output to a postscript file
##D #Gpcmd(h1,'set terminal postscript eps color;set output "helloworld1.eps"')
##D #label the x and y axis
##D GpsetXlabel(h1, 'x')
##D GpsetYlabel(h1, 'y')
##D #set plot style to "lines"
##D Gpsetstyle(h1, 'lines')
##D #plot sin(x) and add a legend
##D GpplotEquation(h1,'sin(x)','Hello World!')
##D #pause R and gnuplot
##D Gppause()
## End(Not run)
#close gnuplot handle
h1<-Gpclose(h1)



