library(RFOC)


### Name: KAMCORN
### Title: SDR data from the Harvard CMT catalog
### Aliases: KAMCORN
### Keywords: misc

### ** Examples

data(KAMCORN)
plot(KAMCORN$LON, KAMCORN$LAT, xlab="LON", ylab="LAT" ,
          main="Kamchatka-Aleutian Inersection", asp=1)
######  
Paz =vector()
Pdip =vector()
Taz =vector()
Tdip =vector()
h = vector()
v = vector()

IFcol = vector()
Fcol = vector()

for(i in 1:10)
  {
    Msdr = CONVERTSDR(KAMCORN$STRIKE[i],
          KAMCORN$DIP[i], KAMCORN$RAKE[i]   )
  MEC = MRake(Msdr$M)
  MEC$UP = FALSE
  IFcol[i] = foc.icolor(MEC$rake1)
    Fcol[i] = foc.color(IFcol[i], 1)

      az1 = Msdr$M$az1
  dip1 = Msdr$M$d1
  az2 = Msdr$M$az2
  dip2 = Msdr$M$d2
  BBB = Bfocvec(az1, dip1,  az2,  dip2)
  V = ternfoc.point(BBB$Bdip, Msdr$M$pd, Msdr$M$td )
 Paz[i] = Msdr$M$paz
  Pdip[i] = Msdr$M$pd
  Taz[i] = Msdr$M$taz
  Tdip[i] = Msdr$M$td
  h[i] = V$h
  v[i] = V$v

     justfocXY( MEC, fcol = Fcol[i], KAMCORN$LON[i],
          KAMCORN$LAT[i] , focsiz = 0.4 )
  }



