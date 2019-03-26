library(Rgnuplot)


### Name: GpcheckHandle
### Title: Check if the gnuplot session handle is valid
### Aliases: GpcheckHandle
### Keywords: programming

### ** Examples

#Initialize the gnuplot handle
h1<-Gpinit()
#returns TRUE for valid handle
## Not run: GpcheckHandle(h1)
#close gnuplot handle
h1<-Gpclose(h1)
#this generates an error
#GpcheckHandle(h1)



