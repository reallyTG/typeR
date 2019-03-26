library(GEOmap)


### Name: Ellipsoidal.Distance
### Title: Ellipsoidal Distance
### Aliases: Ellipsoidal.Distance
### Keywords: misc

### ** Examples


####    compare to spheroidal calculation distaz
####


R.MAPK = 6378.2064
N =20

OUT = list(dadist=0, ed2dist=0, ed1dist=0, dif2=0, dif1=0, pct1=0)
for( i in 1:N)
  {

    olat = runif(1, -90, 90)
    olon = runif(1, 0, 180)

     tlat = runif(1, -90, 90)
    tlon = runif(1, 0, 180)

##########  older spherical calculation
    da = distaz(olat, olon, tlat, tlon)
#####  ed1 = elliposidal earth
    ed1 = Ellipsoidal.Distance(olat, olon, tlat, tlon)
#####   ed2 spherical earth using
############      ellipsoidal calculations, compare with
distaz
   ed2 =  Ellipsoidal.Distance(olat, olon, tlat, tlon, a=R.MAPK*1000, b=R.MAPK*1000)

    dif1 =  da$dist-ed1$dis
    dif2 =  da$dist-ed2$dis

    pct1 = 100*dif1/ed1$dist

##############   OUT = format( c(da$dist, ed2$dist, ed1$dist, dif2, dif1, pct1) , digits=10)

    OUT$dadist[i] =da$dist
    OUT$ed2dist[i] =ed2$dist
OUT$ed1dist[i]=ed1$dist
OUT$dif2[i]= dif2
OUT$dif1[i]=dif1
OUT$pct1[i]=pct1

###cat(paste(collapse=" ", OUT), sep="\n")

  }


print( data.frame(OUT) )



###############   some extreme cases can cause problems
#######  here compare  Ellipsoidal.Distance with spherical program distaz

Alat = c(90,   90,  90,   90,  45,  45,  45,  45,   0,    0,    0, 0)
Alon = c(180, 180,-180, -180,  45,  45,  45,  45,   0,    0,    0, 0)
Blat = c(-90, -45,   0,   45, -45,  0,    0,  -80,  45,   0,    0, 0)
Blon = c(180,-180, 180,    0, -45,  0, -180,  100, -60, -180, 180, 0)


BOUT = list(olat=0, olon=0, tlat=0, tlon=0, dadist=0, ed2dist=0, daaz=0, ed2az=0, dabaz=0, ed2baz=0)

R.MAPK = 6378.2064
for(i in 1:length(Alat))
{

  olat = Alat[i]
  olon  = Alon[i]
  tlat  = Blat[i]
  tlon  = Blon[i]

 da = distaz(olat, olon, tlat, tlon)
  ed2 = Ellipsoidal.Distance(olat, olon, tlat, tlon, a=R.MAPK*1000, b=R.MAPK*1000)
 cat(paste("i=", i), sep="\n")
 

 BOUT$olon[i] =olon
 BOUT$olat[i] =olat
 BOUT$tlat[i] =tlat
 BOUT$tlon[i] =tlon


      BOUT$dadist[i] =da$dist
   BOUT$ed2dist[i] =ed2$dist

BOUT$daaz[i]= da$az
BOUT$dabaz[i]= da$baz

BOUT$ed2az[i]= ed2$az
BOUT$ed2baz[i]=  ed2$revaz


}

print(data.frame(BOUT))







