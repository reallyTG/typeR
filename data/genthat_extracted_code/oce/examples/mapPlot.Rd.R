library(oce)


### Name: mapPlot
### Title: Draw a Map
### Aliases: mapPlot

### ** Examples

## Not run: 
##D library(oce)
##D data(coastlineWorld)
##D 
##D # Example 1.
##D # Mollweide ([1] page 54) is an equal-area projection that works well
##D # for whole-globe views, below shown in a Pacific-focus view.
##D # Note that filling is not employed when the prime meridian
##D # is shifted, because this causes a problem with Antarctica
##D par(mfrow=c(2, 1), mar=c(3, 3, 1, 1))
##D mapPlot(coastlineWorld, projection="+proj=moll", col='gray')
##D mtext("Mollweide", adj=1)
##D cl180 <- coastlineCut(coastlineWorld, lon_0=-180)
##D mapPlot(cl180, projection="+proj=moll +lon_0=-180")
##D mtext("Mollweide", adj=1)
##D par(mfrow=c(1, 1))
##D 
##D # Example 2.
##D # Orthographic projections resemble a globe, making them attractive for
##D # non-technical use, but they are neither conformal nor equal-area, so they
##D # are somewhat limited for serious use on large scales.  See Section 20 of
##D # [1]. Note that filling is not employed because it causes a problem with
##D # Antarctica.
##D par(mar=c(3, 3, 1, 1))
##D mapPlot(coastlineWorld, projection="+proj=ortho +lon_0=-180")
##D mtext("Orthographic", adj=1)
##D 
##D # Example 3.
##D # The Lambert conformal conic projection is an equal-area projection
##D # recommended by [1], page 95, for regions of large east-west extent
##D # away from the equator, here illustrated for the USA and Canada.
##D par(mar=c(3, 3, 1, 1))
##D mapPlot(coastlineCut(coastlineWorld, -100),
##D         longitudelim=c(-130,-55), latitudelim=c(35, 60),
##D         projection="+proj=lcc +lat_0=30 +lat_1=60 +lon_0=-100", col='gray')
##D mtext("Lambert conformal", adj=1)
##D 
##D # Example 4.
##D # The stereographic projection [1], page 120, is conformal, used
##D # below for an Arctic view with a Canadian focus.  Note the trick of going
##D # past the pole: the second latitudelim value is 180 minus the first, and the
##D # second longitudelim is 180 plus the first; this uses image points "over"
##D # the pole.
##D par(mar=c(3, 3, 1, 1))
##D mapPlot(coastlineCut(coastlineWorld, -135),
##D         longitudelim=c(-130, 50), latitudelim=c(70, 110),
##D         proj="+proj=stere +lat_0=90 +lon_0=-135", col='gray')
##D mtext("Stereographic", adj=1)
##D 
##D # Example 5.
##D # Spinning globe: create PNG files that can be assembled into a movie
##D png("globe-%03d.png")
##D lons <- seq(360, 0, -15)
##D par(mar=rep(0, 4))
##D for (i in seq_along(lons)) {
##D     p <- paste("+proj=ortho +lat_0=30 +lon_0=", lons[i], sep="")
##D     if (i == 1) {
##D         mapPlot(coastlineCut(coastlineWorld, lons[i]),
##D                 projection=p, col="lightgray")
##D         xlim <- par("usr")[1:2]
##D         ylim <- par("usr")[3:4]
##D     } else {
##D         mapPlot(coastlineCut(coastlineWorld, lons[i]),
##D                 projection=p, col="lightgray",
##D                 xlim=xlim, ylim=ylim, xaxs="i", yaxs="i")
##D     }
##D }
##D dev.off()
## End(Not run)



