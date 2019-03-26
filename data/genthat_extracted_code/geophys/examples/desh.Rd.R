library(geophys)


### Name: desh
### Title: Display Mesh
### Aliases: desh
### Keywords: misc

### ** Examples


###  warping of the ground from a Mogi source
 P=1e5
 a = 0.01
         f = .1
      nu=0.25
         E = 10e13
     mu = E/(2*(1+nu));
    
EX = seq(from=-3, by=.4, to= 3)
     mm = RPMG::meshgrid(EX, EX)
  rho = sqrt(mm$x^2 +  mm$y^2)

cen = list(x=mean(EX), y=mean(EX))

are = sqrt( (mm$x-cen$x)^2  + (mm$y-cen$y)^2 )


 o1 = mogi1(a, P, rho, mu, f)


shiftx =  o1$ur*(mm$x-cen$x)/are
shifty =  o1$ur*(mm$y-cen$y)/are 

newmesh = list(x=mm$x+shiftx , y=mm$y+shifty)

desh(mm, add=FALSE, PTS=FALSE, colmesh=grey(.8) )


desh(newmesh, add=TRUE, PTS=FALSE, colmesh=rgb(.6,.8, .6) )









