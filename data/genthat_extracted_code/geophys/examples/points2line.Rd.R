library(geophys)


### Name: points2line
### Title: Points to Line
### Aliases: points2line
### Keywords: misc

### ** Examples



S= stressSETUP()
      pstart()
PLOTbox(S$Rax, S$Rbox, axcol= 'green', boxcol= 'purple')
      PLOTplane(S$Rp, planecol="brown")

 basepoint = 3

        legpoints = c(7,4,2)

   

        VL =   cbind( rep(S$Rbox[basepoint,1] , length(legpoints)),
     rep(S$Rbox[basepoint,2] , length(legpoints)),
          S$Rbox[legpoints,1], S$Rbox[legpoints,2])

      Lp=list() 
Lp$x=c(40.0180732557)
Lp$y=c(40.4847345741)

 G = points2line(Lp, VL )




