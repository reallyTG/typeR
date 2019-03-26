library(Rgnuplot)


### Name: Gperrmsg
### Title: Get gnuplot's error messages
### Aliases: Gperrmsg
### Keywords: programming

### ** Examples

#Initialize the gnuplot handle
h1<-Gpinit()
## Not run: 
##D Gpcmd(h1,'plot 0/0')
##D Gperrmsg(h1)
## End(Not run)
#close gnuplot handle
h1<-Gpclose(h1)



