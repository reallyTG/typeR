library(geophys)


### Name: PLOTplane
### Title: Plot Plane on box
### Aliases: PLOTplane
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


####   set three points and combine them with rbind
     P1 = xscale*c(.2, 1,1,0)
    P2 = xscale*c(1, .1,1,0)
    P3 = xscale*c(1, 1,.4,0)

    PPs = rbind(P1, P2, P3)
    
  ###  convert points for view
Rp = PPs  

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
 ##############  plot the plane
PLOTplane(Rp)

     P1 = xscale*c(0, 0,.4,0)
    P2 = xscale*c(0.8, 0,0,0)
    P3 = xscale*c(0, .7, 0 ,0)

    PPs = rbind(P1, P2, P3)
    
  ###  convert points for view
Rp = PPs  

PLOTplane(Rp, planecol = "gold" )





