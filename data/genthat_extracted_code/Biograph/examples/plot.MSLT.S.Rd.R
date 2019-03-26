library(Biograph)


### Name: plot.MSLT.S
### Title: Plots survival function.
### Aliases: plot.MSLT.S

### ** Examples
   	
# The multistate life table based on occurrence-exposure rates
    data (GLHS)
    param <- Parameters (GLHS)
    cr <- Cumrates (irate=3,Bdata=GLHS)
    S <- MSLT.S(cr$oe)
    radix <- c(10000,0)
    mslt <- MSLT.e (S,radix)
    
# Plot the multistate survival function (object of class 'MSLT.S' )
    z<- plot (x=S$S,e0=mslt$e0,title="Multistate survival function",area=TRUE,order=c("N","J"))



