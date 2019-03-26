library(Rgnuplot)


### Name: GpWindowStatus
### Title: Status of an X11 window
### Aliases: GpWindowStatus
### Keywords: programming

### ** Examples

#Initialize the gnuplot handle
h1<-Gpinit()
## Not run: 
##D GpWindowStatus(0)
##D #plot sin(x)
##D GpplotEquation(h1,'sin(x)','')
##D GpWindowStatus(0)
##D #pause R and gnuplot
##D Gppause()
##D GpWindowStatus(0)
## End(Not run)
#close gnuplot handle
h1<-Gpclose(h1)



