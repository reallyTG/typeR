library(GEOmap)


### Name: plothypos
### Title: Plot Edicenters
### Aliases: plothypos
### Keywords: misc

### ** Examples

library(geomapdata)

data('EHB.LLZ')
data('japmap', package='geomapdata')

RLAT = range(japmap$POINTS$lat)
RLON = range(japmap$POINTS$lon)

JLAT = expandbound(RLAT, .1) 
JLON = expandbound(RLON, .1) 

PROJ = japmap$PROJ
##############  select the events in the region
isel1 = which( japmap$STROKES$code != "i" & japmap$STROKES$num>120 )

sel = which(
EHB.LLZ$lat > JLAT[1] &
EHB.LLZ$lat < JLAT[2] &
EHB.LLZ$lon  > JLON[1] &
EHB.LLZ$lon < JLON[2])

sel = sel[1:200]

plotGEOmapXY(japmap , PROJ=PROJ, SEL=isel1,  add=FALSE, MAPcol="black") 

plothypos(EHB.LLZ$lat[sel], EHB.LLZ$lon[sel], EHB.LLZ$z[sel], PROJ,
mag=NULL,  cex=.8)


## Not run: 
##D 
##D fn = "/home/lees/WORK/SENDAI.EVENT/catsearch.8757"
##D 
##D g = getANSS(fn, skip=2)
##D g$jd = getjul(g$yr, g$mo, g$dom)
##D 
##D sel = which(
##D g$lat > JLAT[1] &
##D g$lat < JLAT[2] &
##D g$lon  > JLON[1] &
##D g$lon < JLON[2])
##D 
##D olat = g$lat[sel]
##D olon = g$lon[sel]
##D ordz = g$z[sel]
##D 
##D mag = g$mag[sel]
##D 
##D gm = getmagsize(mag)
##D 
##D 
##D plotGEOmapXY(japmap , PROJ=PROJ,   add=FALSE, MAPcol="black") 
##D plothypos(g$lat[sel], g$lon[sel], g$z[sel], PROJ,
##D mag=NULL,  cex=gm)
##D 
##D 
##D plotGEOmapXY(japmap , PROJ=PROJ,   add=FALSE, MAPcol="black") 
##D plothypos(olat, olon, ordz, PROJ,
##D mag=NULL,  cex=gm)
##D 
##D 
##D plotGEOmapXY(japmap , PROJ=PROJ,   add=FALSE, MAPcol="black") 
##D plothypos(olat, olon, ordz, PROJ,
##D mag=mag,  cex=1 )
##D 
##D 
##D 
##D ##################  transparent plot
##D pdfname = local.file('TOHOKU', "pdf")
##D 
##D cairo_pdf(file = pdfname , width = 8, height = 10)
##D plotGEOmapXY(japmap , PROJ=PROJ,   add=FALSE, MAPcol="black") 
##D plothypos(olat, olon, ordz, PROJ,
##D mag=mag,  cex=1, alpha=.3 )
##D dev.off()
##D ################## 
##D 
##D 
##D 
## End(Not run)







