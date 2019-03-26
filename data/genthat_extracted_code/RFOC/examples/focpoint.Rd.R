library(RFOC)


### Name: focpoint
### Title: add point on focal sphere
### Aliases: focpoint
### Keywords: aplot

### ** Examples


###  create focal mech
ALIM=c(-1,-1, +1, +1)
s=65
d=25
r=13
mc = CONVERTSDR(s,d,r )
  MEC = MRake(mc$M)
  MEC$UP = FALSE
  MEC$icol =  foc.icolor(MEC$rake1)
  MEC$ileg =  focleg(MEC$icol)
  MEC$fcol =   foc.color(MEC$icol)
  MEC$CNVRG = NA
  MEC$LIM = ALIM

###  plot focal mech
Beachfoc(MEC, fcol=MEC$fcol, fcolback="white")

###  now add the F anf G axes
focpoint(MEC$F$az, MEC$F$dip, pch=5, lab="F", UP=MEC$UP)
    focpoint(MEC$G$az, MEC$G$dip, pch=5, lab="G", UP=MEC$UP)





