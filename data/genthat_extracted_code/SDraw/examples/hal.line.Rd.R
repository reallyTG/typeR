library(SDraw)


### Name: hal.line
### Title: Draws a Halton Lattice sample from a linear (line) resource .
### Aliases: hal.line
### Keywords: design survey

### ** Examples


# Default sample of Hawaii coastline. 1D balance
samp <- hal.line( HI.coast, 100 )

   
# Desire frame with spacing = 500 meters
# Frame has ~3144 points = lineLength(HI.coast)/500 
samp <- hal.line( HI.coast, 100, balance="2D", frame.spacing=500)
  
# Desire 2000 points in frame
# Set frame.spacing = lineLength / 2000 
# Set Halton lattice to contain  
#    2592 boxes = prod(c(2,3)^c(5,4))  
samp <- hal.line( HI.coast, 100, J=c(5,4), balance="2D", 
   frame.spacing=lineLength(HI.coast)/2000)





