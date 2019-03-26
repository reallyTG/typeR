library(Rgnuplot)


### Name: Gpcmd
### Title: Send one or more commands to gnuplot
### Aliases: Gpcmd
### Keywords: programming

### ** Examples

#"Hello World!" - text on legend
#Initialize the gnuplot handle
h1<-Gpinit()
#set output to a postscript file
#Gpcmd(h1,'set terminal postscript eps color;set output "helloworld1.eps"')
#label the x and y axis
GpsetXlabel(h1, 'x')
GpsetYlabel(h1, 'y')
#set plot style to "lines"
Gpsetstyle(h1, 'lines')
#plot and add a legend
## Not run: 
##D GpplotEquation(h1,'sin(x)','Hello World!')
##D #pause R and gnuplot
##D Gppause()
## End(Not run)
#close gnuplot handle
h1<-Gpclose(h1)



