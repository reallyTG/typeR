library(Rquake)


### Name: getregionals
### Title: Extract regional events
### Aliases: getregionals
### Keywords: misc

### ** Examples



## Not run: 
##D fpde = '/Users/lees/Site/CHAC/pde_catalog_NOV_2011.txt'
##D 
##D ipde = prepPDE(fpde)
##D Mlat = median(stas$lat)
##D Mlon = median(stas$lon)
##D 
##D Lt1 =  JtimL(upf$LOC)
##D t1 = Lt1-3/(24*6)
##D t2 = Lt1+3/(24*6)
##D 
##D localeqs = getregionals(KAT, Mlat, Mlon, rad=100 ,  t1=NULL, t2=NULL)
##D 
##D for(i in 1:length(localeqs))
##D   {
##D j = localeqs[i]
##D  at1 = KAT$jsec[j]
##D         at2 = at1+20/(24*60)
##D  GH = Mine.seis(at1, at2, DBnov , gstas, gcomps, kind=2, Iendian=1, BIGLONG=FALSE)
##D 
##D hord = which(GH$COMPS=="V")
##D         
##D         gret = swig(GH, sel=hord, PADDLAB=buts)
##D ####  save any picks to a file on disc for later use
##D 
##D 
##D   }
##D 
##D 
## End(Not run)





