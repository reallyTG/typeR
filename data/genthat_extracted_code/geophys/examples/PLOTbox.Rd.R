library(geophys)


### Name: PLOTbox
### Title: Plot 3D box
### Aliases: PLOTbox
### Keywords: misc

### ** Examples


#######    set colors
 axcol = 'black'
 boxcol = 'blue'
 planecol = 'brown'

####   view angle
 Rview  =    RFOC::ROTZ(-130) 

###   set arbitrary scale
    xscale = 100


###   create box  and scale it
   BOX <-matrix(c(0,0,0,0,
            0, 1, 0,0,
            0, 1, 1,0,
            0, 0, 1,0,
            1,0,0,0,
            1, 1, 0,0,
            1, 1, 1,0,
            1, 0, 1,0), ncol=4, byrow=TRUE)


    BOX = xscale*BOX

    ##############   create axes and scale them
AX = matrix(c(0,0,0,0,
            1, 0, 0,0,
            0, 0, 0,0,
            0, 1, 0,0,
            0,0,0,0,
            0, 0, 1,0), ncol=4, byrow=TRUE)

    AX = 1.5*xscale*AX

 ##############   rotate axes and box
    Rax =  AX 

    
          Rbox =   BOX 

 ##############  start the figure
pstart(xscale=xscale)
 ######  plot the box
PLOTbox(Rax, Rbox, axcol= 'black', boxcol= 'blue')







