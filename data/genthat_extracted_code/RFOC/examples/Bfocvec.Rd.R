library(RFOC)


### Name: Bfocvec
### Title: Angles for Ternary plot
### Aliases: Bfocvec
### Keywords: misc

### ** Examples


Msdr = CONVERTSDR(55.01, 165.65,  29.2   )
 MEC = MRake(Msdr$M)
  MEC$UP = FALSE 
   az1 = Msdr$M$az1
  dip1 = Msdr$M$d1
  az2 = Msdr$M$az2
  dip2 = Msdr$M$d2
  BBB = Bfocvec(az1, dip1,  az2,  dip2)
  V = ternfoc.point(BBB$Bdip, Msdr$M$pd, Msdr$M$td )




