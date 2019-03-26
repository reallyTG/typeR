library(RFOC)


### Name: PlotTernfoc
### Title: Ternary Distribution of focal mechanisms
### Aliases: PlotTernfoc
### Keywords: aplot hplot

### ** Examples

Z1 = c(159.33,51.6,206,18,78,
161.89,54.5,257,27,133,
170.03,53.57,-44,13,171,
154.99,50.16,-83,19,-40,
151.09,47.15,123,23,-170,
176.31,51.41,-81,22,122,
153.71,46.63,205,28,59,
178.39,51.21,-77,16,126,
178.27,51.1,-86,15,115,
177.95,51.14,-83,25,126,
178.25,51.18,215,16,27
)

MZ = matrix(Z1, ncol=5, byrow=TRUE)

h = vector()
v = vector()
Fcol = vector()
for(i in 1:length(MZ[,3]))
  {
    Msdr = CONVERTSDR(MZ[i,3], MZ[i,4], MZ[i,5])
MEC = MRake(Msdr$M)
  MEC$UP = FALSE

 az1 = Msdr$M$az1
  dip1 = Msdr$M$d1
  az2 = Msdr$M$az2
  dip2 = Msdr$M$d2
  BBB = Bfocvec(az1, dip1,  az2,  dip2)
  V = ternfoc.point(BBB$Bdip, Msdr$M$pd, Msdr$M$td )

  h[i] = V$h
  v[i] = V$v
Fcol[i] = foc.color(foc.icolor(MEC$rake1), pal=1)

}


PlotTernfoc(h,v,x=0, y=0, siz=1, fcols=Fcol, add=FALSE, LAB=TRUE)

MFOC1 = SDRfoc(65,90,1, u=FALSE, ALIM=c(-1,-1, +1, +1), PLOT=FALSE)
    Fcol1 = foc.color(foc.icolor(MFOC1$rake1), pal=1)
 MFOC2 = SDRfoc(135,45,-90, u=FALSE, ALIM=c(-1,-1, +1, +1), PLOT=FALSE)
    Fcol2 = foc.color(foc.icolor(MFOC2$rake1), pal=1)
 MFOC3 = SDRfoc(135,45,90, u=FALSE, ALIM=c(-1,-1, +1, +1), PLOT=FALSE)
    Fcol3 = foc.color(foc.icolor(MFOC3$rake1), pal=1)

justfocXY( MFOC3, fcol = Fcol3, 1.2, -0.9, focsiz = 0.4 )
justfocXY( MFOC2, fcol = Fcol2, -1.2, -0.9,  focsiz = 0.4  )
justfocXY( MFOC1, fcol = Fcol1, 0, 1.414443+.2,  focsiz = 0.4  )





